use cfg_if::cfg_if;
#[cfg(feature = "ssr")]
use spinnybox_com::server;

cfg_if! {
    if #[cfg(feature = "ssr")] {
        #[tokio::main]
        async fn main() -> std::io::Result<()> {
            server::run().await
        }
    }
    else {
        pub fn main() {}
    }
}
