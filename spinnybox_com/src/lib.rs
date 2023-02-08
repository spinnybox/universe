pub use cookie_data::ColorTheme;
pub use cookie_data::CookieData;
pub use routes::*;
#[cfg(feature = "ssr")]
pub use server::*;

mod components;
mod cookie_data;
mod root;
mod routes;
#[cfg(feature = "ssr")]
mod server;
