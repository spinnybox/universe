use leptos::*;
use leptos_meta::Meta;
use leptos_meta::MetaProps;

#[server(ToggleDarkMode, "/rpc")]
pub async fn toggle_dark_mode(cx: Scope, prefers_dark: bool) -> Result<bool, ServerFnError> {
  use axum::http::header::SET_COOKIE;
  use axum::http::HeaderMap;
  use axum::http::HeaderValue;
  use leptos_axum::ResponseOptions;
  use leptos_axum::ResponseParts;

  let response =
    use_context::<ResponseOptions>(cx).expect("must have leptos_axum::ResponseOptions provided");
  let mut response_parts = ResponseParts::default();
  let mut headers = HeaderMap::new();
  headers.insert(
    SET_COOKIE,
    HeaderValue::from_str(&format!("darkmode={prefers_dark}; Path=/"))
      .expect("to create header value for cookie"),
  );

  response_parts.headers = headers;
  response.overwrite(response_parts).await;

  Ok(prefers_dark)
}

#[cfg(not(feature = "ssr"))]
fn initial_prefers_dark(cx: Scope) -> bool {
  let doc = document().unchecked_into::<web_sys::HtmlDocument>();
  let cookie = doc.cookie().unwrap_or_default();
  cookie.contains("darkmode=true")
}

#[cfg(feature = "ssr")]
fn initial_prefers_dark(cx: Scope) -> bool {
  let mut request =
    use_context::<leptos_axum::RequestParts>(cx).expect("to have access to the request");
  let cookie = utils::from_leptos_request_parts(&mut request);
}

#[cfg(feature = "ssr")]
mod utils {
  use axum::async_trait;
  use axum::extract::rejection::TypedHeaderRejection;
  use axum::extract::rejection::TypedHeaderRejectionReason;
  use axum::headers::Header;
  use axum::headers::HeaderMapExt;
  use axum::response::IntoResponse;
  use axum::TypedHeader;
  use leptos_axum::RequestParts;

  pub fn from_leptos_request_parts<T: Header>(
    parts: &mut RequestParts,
  ) -> Result<TypedHeader<T>, TypedHeaderRejection> {
    match parts.headers.typed_try_get::<T>() {
      Ok(Some(value)) => Ok(TypedHeader(value)),
      Ok(None) => {
        Err(Self::Rejection {
          name: T::name(),
          reason: TypedHeaderRejectionReason::Missing,
        })
      }
      Err(err) => {
        Err(TypedHeaderRejection {
          name: T::name(),
          reason: TypedHeaderRejectionReason::Error(err),
        })
      }
    }
  }
}
