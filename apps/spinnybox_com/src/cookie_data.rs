use std::string::ToString;

#[cfg(feature = "ssr")]
use axum::async_trait;
#[cfg(feature = "ssr")]
use axum::extract::FromRequestParts;
#[cfg(feature = "ssr")]
use http::request::Parts;
use serde::Deserialize;
use serde::Serialize;
use strum::IntoEnumIterator;
use strum_macros::Display;
use strum_macros::EnumIter;
#[cfg(feature = "ssr")]
use tower_cookies::Cookies;
#[cfg(feature = "ssr")]
use tower_cookies::PrivateCookies;

#[cfg(feature = "ssr")]
pub static KEY: once_cell::sync::OnceCell<tower_cookies::Key> = once_cell::sync::OnceCell::new();

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct CookieData {
  /// The theme to use.
  pub theme: ColorTheme,
}

#[derive(Clone)]
pub struct CookieDataContext {
  pub data: CookieData,
  #[cfg(feature = "ssr")]
  cookies: std::sync::Arc<PrivateCookies<'static>>,
}

impl CookieDataContext {
  /// The cookie is stored in a json object with this name as the key.
  pub const NAME: &'static str = "_session_spinnybox";

  /// Get the current theme.
  pub fn theme(&self) -> ColorTheme {
    self.data.theme
  }

  /// Check if the theme is dark.
  pub fn is_dark_theme(&self) -> bool {
    self.data.theme == ColorTheme::Dark
  }

  /// Toggle the theme.
  pub fn toggle_theme(&mut self) {
    self.data.theme = self.data.theme.toggle();
  }

  /// Toggle the theme.
  pub fn set_theme(&mut self, theme: ColorTheme) {
    self.data.theme = theme;
  }

  /// Save the changes made to the cookie on the server side. Changes made on
  /// the client side are ignored.
  #[cfg(feature = "ssr")]
  pub fn save(&self) {
    use tower_cookies::Cookie;

    let json = serde_json::to_string(&self.data).expect("Failed to serialize cookie data.");
    let cookie = Cookie::new(Self::NAME, json);
    self.cookies.add(cookie);
  }
}

#[cfg(any(feature = "ssr", target_arch = "wasm32"))]
impl From<leptos::Scope> for CookieDataContext {
  #[cfg(feature = "ssr")]
  fn from(cx: leptos::Scope) -> Self {
    use leptos::*;

    use_context::<CookieDataContext>(cx).expect("Cookies not found in context.")
  }

  #[cfg(target_arch = "wasm32")]
  #[cfg(not(feature = "ssr"))]
  fn from(cx: leptos::Scope) -> Self {
    use wasm_cookies::get_raw;

    let data: CookieData = get_raw(CookieDataContext::NAME)
      .and_then(|cookie| serde_json::from_str(cookie.as_str()).ok())
      .unwrap_or(Default::default());

    Self { data }
  }
}

#[cfg(feature = "ssr")]
impl From<Cookies> for CookieDataContext {
  fn from(cookies: Cookies) -> Self {
    use std::sync::Arc;

    let key = KEY
      .get()
      .expect("The cookie key must be initialized before use.");

    let private_cookies = cookies.private(key);

    let data: CookieData = private_cookies
      .get(CookieDataContext::NAME)
      .and_then(|cookie| serde_json::from_str(cookie.value()).ok())
      .unwrap_or(Default::default());

    Self {
      data,
      cookies: Arc::new(private_cookies),
    }
  }
}

#[cfg(feature = "ssr")]
#[async_trait]
impl<S> FromRequestParts<S> for CookieDataContext
where
  S: Send + Sync,
{
  type Rejection = (http::StatusCode, &'static str);

  async fn from_request_parts(req: &mut Parts, state: &S) -> Result<Self, Self::Rejection> {
    Ok(Cookies::from_request_parts(req, state).await?.into())
  }
}

/// The color theme used.
#[derive(Debug, Eq, PartialEq, Copy, Clone, Display, EnumIter, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum ColorTheme {
  /// The `light` theme.
  #[strum(serialize = "light")]
  Light,

  /// The `dark` theme.
  #[strum(serialize = "dark")]
  Dark,
}

impl Default for ColorTheme {
  fn default() -> Self {
    Self::Light
  }
}

impl ColorTheme {
  /// Toggle between light and dark mode.
  pub fn toggle(&self) -> Self {
    if self == &Self::Light {
      Self::Dark
    } else {
      Self::default()
    }
  }

  /// Rotate the color themes.
  pub fn rotate(&self) -> Self {
    let mut early_return = false;

    for theme in Self::iter() {
      if early_return {
        return theme;
      }

      if &theme == self {
        early_return = true;
      }
    }

    Self::default()
  }
}
