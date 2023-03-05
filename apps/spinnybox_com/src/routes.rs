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
  use std::net::SocketAddr;

  use axum::body::Body;
  use axum::routing::get;
  use axum::routing::post;
  use axum::Router;
  use dotenvy::dotenv;
  use http::Request;
  use leptos_axum::generate_route_list;
  use leptos_axum::handle_server_fns;
  use leptos_axum::render_app_async_with_context;
  use leptos_axum::render_app_to_stream_in_order_with_context;
  use leptos_axum::render_app_to_stream_with_context;
  use tower_cookies::CookieManagerLayer;
  use tower_cookies::Cookies;
  use tower_cookies::Key;
  use tower_http::compression::CompressionLayer;

  use super::*;
  use crate::components::SetTheme;
  use crate::file_and_error_handler;
  use crate::root::*;
  use crate::CookieDataContext;
  use crate::KEY;

  fn register_server_functions() -> Result<(), ServerFnError> {
    SetTheme::register().expect("SetTheme server function failed to register!");
    Ok(())
  }

  pub async fn run() -> std::io::Result<()> {
    register_server_functions().expect("Failed to register server functions!");
    _ = dotenv();
    let key = std::env::var("COOKIE_SECRET")
      .expect("The `COOKIE_SECRET` environment variable is not defined!");
    let port = std::env::var("PORT")
      .ok()
      .and_then(|p| p.parse::<u16>().ok());
    let key = key.as_bytes();
    KEY.set(Key::from(key)).ok();

    let config = get_configuration(Some("./apps/spinnybox_com/Cargo.toml"))
      .await
      .unwrap();
    let mut leptos_options = config.leptos_options;

    if let Some(port) = port {
      leptos_options.site_addr = SocketAddr::from(([0, 0, 0, 0], port));
    }

    let address = leptos_options.site_addr.clone();
    // let site_root = &leptos_options.site_root;
    // let pkg_dir = &leptos_options.site_pkg_dir;

    // // The URL path of the generated JS/WASM bundle from cargo-leptos
    // let bundle_path = format!("/{site_root}/{pkg_dir}");
    // // The filesystem path of the generated JS/WASM bundle from cargo-leptos
    // let bundle_filepath = format!("./{site_root}/{pkg_dir}");
    // let favicon_path = "/favicon.ico";
    // let favicon_filepath = format!("./{site_root}/favicon.ico");

    // setup logging
    simple_logger::SimpleLogger::new()
      .with_level(log::LevelFilter::Warn)
      .with_module_level("auth_sessions_example", log::LevelFilter::Trace)
      .init()
      .expect("couldn't initialize logging");

    // Generate the list of routes in your Leptos App
    let routes = generate_route_list(|cx| view! { cx, <Root /> }).await;

    let app = Router::new()
      .route("/rpc/*fn_name", post(handle_server_fns))
      .leptos_routes_handlers(leptos_options.clone(), routes, |cx| {
        log!("RENDERING APP!!!");
        view! { cx , <Root /> }
      })
      .layer(CookieManagerLayer::new())
      .fallback(file_and_error_handler)
      .layer(CompressionLayer::new());

    axum::Server::bind(&address)
      .serve(app.into_make_service())
      .await
      .unwrap();
    Ok(())
  }

  trait LeptosRouteHandler {
    fn leptos_routes_handlers<IV>(
      self,
      options: LeptosOptions,
      paths: Vec<(String, SsrMode)>,
      app_fn: impl Fn(leptos::Scope) -> IV + Clone + Send + 'static,
    ) -> Self
    where
      IV: IntoView + 'static;
  }

  impl LeptosRouteHandler for Router {
    fn leptos_routes_handlers<IV>(
      self,
      options: LeptosOptions,
      paths: Vec<(String, SsrMode)>,
      app_fn: impl Fn(leptos::Scope) -> IV + Clone + Send + 'static,
    ) -> Self
    where
      IV: IntoView + 'static,
    {
      let mut router = self;
      for (path, mode) in paths.iter() {
        let app_fn = app_fn.clone();
        let options = options.clone();
        let path = if path.ends_with('*') {
          format!("{}key", path)
        } else {
          path.to_string()
        };
        log!("Adding PATH: {}", path);
        router = router.route(
          &path,
          match mode {
            SsrMode::OutOfOrder => {
              let handler = move |req: Request<Body>| {
                let app_fn = app_fn.clone();
                let cookies = req
                  .extensions()
                  .get::<Cookies>()
                  .expect("Can't extract cookies. Is `CookieManagerLayer` enabled?")
                  .clone();
                render_app_to_stream_with_context(
                  options,
                  move |cx| {
                    log!("OutOfOrder: ADDED COOKIE CONTEXT!!!");
                    provide_context::<CookieDataContext>(cx, cookies.clone().into());
                  },
                  app_fn,
                )(req)
              };

              get(handler)
            }
            SsrMode::InOrder => {
              let handler = move |req: Request<Body>| {
                let cookies = req
                  .extensions()
                  .get::<Cookies>()
                  .expect("Can't extract cookies. Is `CookieManagerLayer` enabled?")
                  .clone();
                render_app_to_stream_in_order_with_context(
                  options,
                  move |cx| {
                    log!("InOrder: ADDED COOKIE CONTEXT!!!");
                    provide_context::<CookieDataContext>(cx, cookies.clone().into());
                  },
                  app_fn,
                )(req)
              };

              get(handler)
            }
            SsrMode::Async => {
              let handler = move |req: Request<Body>| {
                let cookies = req
                  .extensions()
                  .get::<Cookies>()
                  .expect("Can't extract cookies. Is `CookieManagerLayer` enabled?")
                  .clone();
                render_app_async_with_context(
                  options,
                  move |cx| {
                    log!("Async: ADDED COOKIE CONTEXT!!!");
                    provide_context::<CookieDataContext>(cx, cookies.clone().into());
                  },
                  app_fn,
                )(req)
              };

              get(handler)
            }
          },
        );
      }

      router
    }
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
    log!("MOUNTING TO BODY");
    #[cfg(not(feature = "ssr"))]
    {
      use crate::CookieDataContext;
      provide_context::<CookieDataContext>(
        cx,
        CookieDataContext {
          data: Default::default(),
        },
      );
    }

    view! { cx , <Root /> }
  });
}

#[path = "./routes/index.rs"]
pub(crate) mod route_index;
