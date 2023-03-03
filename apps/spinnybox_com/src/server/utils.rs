use axum::async_trait;
use axum::extract::rejection::TypedHeaderRejection;
use axum::extract::rejection::TypedHeaderRejectionReason;
use axum::headers::Header;
use axum::headers::HeaderMap;
use axum::headers::HeaderMapExt;
use axum::headers::HeaderValue;
use axum::response::IntoResponse;
use axum::TypedHeader;
use http::request::Parts;
use http::Request;
use leptos_axum::RequestParts;

pub fn get_typed_header<T: Header>(
  headers: HeaderMap<HeaderValue>,
) -> Result<TypedHeader<T>, TypedHeaderRejection> {
  match headers.typed_try_get::<T>() {
    Ok(Some(value)) => Ok(TypedHeader(value)),
    Ok(None) => {
      Err(TypedHeaderRejection {
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

/// Convert the `leptop_axum::RequestParts` to `http::request::Parts`
pub fn request_parts_to_parts(request_parts: &RequestParts) -> Parts {
  Parts {
    method: request_parts.method,
    uri: request_parts.uri,
    version: request_parts.version,
    headers: request_parts.headers,
    extensions: Default::default(),
    _priv: (),
  }
}
