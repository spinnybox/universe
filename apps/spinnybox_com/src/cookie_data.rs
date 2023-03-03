use serde::Deserialize;
use serde::Serialize;
use strum::IntoEnumIterator;
use strum_macros::Display;
use strum_macros::EnumIter;

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct CookieData {
  /// The theme to use.
  pub theme: ColorTheme,
}

impl CookieData {
  /// The cookie is stored in a json object with this name as the key.
  pub const NAME: &'static str = "session_cookie_key";

  /// Toggle the theme.
  pub fn toggle_theme(&mut self) {
    self.theme = self.theme.toggle();
  }
}

/// The color theme used.
#[derive(Debug, Eq, PartialEq, Clone, Display, EnumIter, Serialize, Deserialize)]
#[strum(serialize_all = "camelCase")]
pub enum ColorTheme {
  /// The `light` theme.
  Light,

  /// The `dark` theme.
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
