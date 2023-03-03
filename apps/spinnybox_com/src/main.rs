#[cfg(feature = "ssr")]
#[tokio::main]
async fn main() -> std::io::Result<()> {
  spinnybox_com::ssr::run().await
}

#[cfg(not(feature = "ssr"))]
pub fn main() {
  // no client-side main function
}
