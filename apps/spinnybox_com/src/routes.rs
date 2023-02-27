use leptos::*;
use leptos_router::*;
// use route_index::Layout as RouteIndexLayout;
// use route_index::LayoutProps as RouteIndexLayoutProps;
use route_index::NotFound as RouteIndexNotFound;
use route_index::NotFoundProps as RouteIndexNotFoundProps;
use route_index::Page as RouteIndexPage;
use route_index::PageProps as RouteIndexPageProps;
#[cfg(feature = "hydrate")]
use wasm_bindgen::prelude::wasm_bindgen;

use crate::components::Nav;
use crate::components::NavProps;

#[component]
pub fn FileRoutes(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <Router>
      <header>
        <Nav />
      </header>
      <main>
        <Routes>
          <Route path="/" view=move |cx| view! { cx , <RouteIndexPage /> } />
          <Route path="about" view=move |cx| view! { cx, <div>"About this site"</div> } />
          <Route path= "*" view=move |cx| view! { cx , <RouteIndexNotFound /> } />
        </Routes>
      </main>
    </Router>
  }
}

#[cfg(feature = "ssr")]
pub mod ssr {
  use axum::error_handling::HandleError;
  use axum::routing::post;
  use axum::Router;
  use dotenvy::dotenv;
  use http::StatusCode;
  use leptos_axum::handle_server_fns;
  use leptos_axum::render_app_to_stream;
  use tower_cookies::CookieManagerLayer;
  use tower_cookies::Key;
  use tower_http::services::ServeDir;

  use super::*;
  use crate::root::*;
  use crate::KEY;

  fn register_server_functions() {}

  async fn handle_file_error(err: std::io::Error) -> (StatusCode, String) {
    (StatusCode::NOT_FOUND, format!("File Not Found: {}", err))
  }

  pub async fn run() -> std::io::Result<()> {
    register_server_functions();
    _ = dotenv();
    let key: &[u8] = std::env::var("COOKIE_SECRET").unwrap().as_bytes();
    KEY.set(Key::from(key)).ok();

    let config = get_configuration(Some("spinnybox_com/Cargo.toml"))
      .await
      .unwrap();
    let leptos_options = config.leptos_options;
    let address = leptos_options.site_address.clone();
    let site_root = &leptos_options.site_root;
    let pkg_dir = &leptos_options.site_pkg_dir;

    // The URL path of the generated JS/WASM bundle from cargo-leptos
    let bundle_path = format!("/{site_root}/{pkg_dir}");
    // The filesystem path of the generated JS/WASM bundle from cargo-leptos
    let bundle_filepath = format!("./{site_root}/{pkg_dir}");
    let favicon_path = "/favicon.ico";
    let favicon_filepath = format!("./{site_root}/favicon.ico");

    let favicon_service = HandleError::new(ServeDir::new(favicon_filepath), handle_file_error);
    let cargo_leptos_service = HandleError::new(ServeDir::new(&bundle_filepath), handle_file_error);
    let app = Router::new()
      .route("/rpc/*fn_name", post(handle_server_fns))
      .layer(CookieManagerLayer::new())
      .nest_service(favicon_path, favicon_service)
      .nest_service(&bundle_path, cargo_leptos_service)
      .fallback(render_app_to_stream(
        leptos_options,
        |cx| view! { cx , <Root /> },
      ));
    // .nest_service("/", assets_service);

    axum::Server::bind(&address)
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

#[path = "./routes/index.rs"]
pub(crate) mod route_index;
