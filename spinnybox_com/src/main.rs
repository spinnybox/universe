use cfg_if::cfg_if;

cfg_if! {
  if #[cfg(feature = "ssr")] {
    #[tokio::main]
    async fn main() -> std::io::Result<()> {
      spinnybox_com::ssr::run().await
    }
  } else {
    pub fn main() {}
  }
}
