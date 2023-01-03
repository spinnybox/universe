#[path = "./routes/index.rs"]
pub(crate) mod route_index;
use leptos::*;
use leptos_meta::*;
use leptos_router::*;
use route_index::Layout as RouteIndexLayout;
use route_index::LayoutProps as RouteIndexLayoutProps;
use route_index::NotFound as RouteIndexNotFound;
use route_index::NotFoundProps as RouteIndexNotFoundProps;
use route_index::Page as RouteIndexPage;
use route_index::PageProps as RouteIndexPageProps;
#[cfg(feature = "hydrate")]
use wasm_bindgen::prelude::wasm_bindgen;

#[component]
pub fn FileRoutes(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <Router>
      <Routes>
        <Route path="" view=move |cx| view! { cx, <RouteIndexLayout /> }>
          <Route path="" view=move |cx| view! { cx , <RouteIndexPage /> } />
          <Route path= "*" view=move |cx| view! { cx , <RouteIndexNotFound /> } />
        </Route>
      </Routes>
    </Router>
  }
}

#[cfg(feature = "ssr")]
pub mod ssr {
  use std::env;
  use std::net::SocketAddr;

  use axum::error_handling::HandleError;
  use axum::routing::get;
  use axum::Router;
  use http::StatusCode;
  use leptos_axum::handler_server_fns;
  use leptos_axum::render_app_to_stream;
  use simple_logger::init_with_level;
  use tower_http::services::ServeDir;

  use super::*;
  use crate::root::*;

  async fn run() -> std::io::Result<()> {
    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    log::debug!("serving at http://{addr}");
    init_with_level(log::Level::Debug).expect("couldn't initialize logging");
    let static_service = HandleError::new(ServeDir::new("./static"), handle_file_error);
    let pkg_service = HandleError::new(ServeDir::new("./pkg"), handle_file_error);

    async fn handle_file_error(err: std::io::Error) -> (StatusCode, String) {
      (StatusCode::NOT_FOUND, format!("File Not Found: {}", err))
    }

    let app = Router::new()
      .nest_service("/pkg", pkg_service)
      .nest_service("/static", static_service)
      .fallback(render_app_to_stream(
        render_options,
        |cx| view! { cx , <Root /> },
      ));
    axum::Server::bind(&addr)
      .serve(app.into_make_service())
      .await
      .unwrap();
    Ok(())
  }
}

#[cfg(feature = "hydrate")]
#[wasm_bindgen]
pub fn hydrate() {
  use crate::root::Root;
  use crate::root::RootProps;

  _ = console_log::init_with_level(log::Level::Debug);
  console_error_panic_hook::set_once();
  leptos::mount_to_body(move |cx| {
    view! { cx , <Root /> }
  });
}
