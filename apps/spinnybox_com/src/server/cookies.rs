use axum::async_trait;
use axum::extract::FromRequestParts;
use http::request::Parts;
use http::StatusCode;
use leptos_axum::RequestParts;
use once_cell::sync::OnceCell;
use tower_cookies::Cookies;
use tower_cookies::Key;

use crate::request_parts_to_parts;
use crate::CookieData;

pub static KEY: OnceCell<Key> = OnceCell::new();
type CookieDataResult = Result<CookieData, (StatusCode, &'static str)>;

#[async_trait]
impl<State> FromRequestParts<State> for CookieData
where
  State: Send + Sync,
{
  type Rejection = (StatusCode, &'static str);

  async fn from_request_parts(parts: &mut Parts, _: &State) -> CookieDataResult {
    Self::from_parts(parts)
  }
}

impl CookieData {
  fn from_parts(parts: &mut Parts) -> CookieDataResult {
    let cookies = parts.extensions.get::<Cookies>().cloned().ok_or((
      StatusCode::INTERNAL_SERVER_ERROR,
      "Can't extract cookies. Is `CookieManagerLayer` enabled?",
    ))?;

    let Some(key) = KEY.get() else {
      return Err((
        StatusCode::INTERNAL_SERVER_ERROR,
        "Missing private key for cookies.",
      ));
    };

    let private_cookies = cookies.private(key);
    let data: Self = private_cookies
      .get(Self::NAME)
      .and_then(|value| value.parse())
      .unwrap_or(Default::default());

    cookies.add(Self::NAME, serde_json::to_string(&data).unwrap());

    Ok(data)
  }

  pub fn from_leptops_request_parts(request_parts: RequestParts) -> CookieDataResult {
    let mut parts = request_parts_to_parts(&request_parts);
    Self::from_parts(&mut parts)
  }
}
