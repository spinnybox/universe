use leptos::*;
use leptos_router::*;

use crate::components::*;

#[component]
pub fn Page(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <TopBackgroundBack>
      <h1>"Index Page"</h1>
      <p>"This is the indexer page"</p>
    </TopBackgroundBack>
  }
}

#[component]
pub fn Layout(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <header class="w-full z-30 fixed bg-transparent backdrop-blur-sm">
      <Nav />
    </header>
    <main class="font-aspekta antialiased bg-white text-slate-800 font-[350] pt-20 min-h-screen w-full">
      <Outlet />
    </main>
  }
}

#[component]
pub fn NotFound(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <h1>"Page not found"</h1>
  }
}

#[component]
fn TopBackgroundBack(cx: Scope, children: Children) -> impl IntoView {
  view! {
    cx,
    <div class="relative w-full h-full">
      <span class="absolute top-0 bottom-0 left-0 right-0 bg-home-top" />
      {children(cx)}
    </div>
  }
}
