use leptos::*;
use leptos_router::*;

use crate::components::*;

#[component]
pub fn Page(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <h1 class="bg-red">"Index Page"</h1>
    <p>"This is the indexer page"</p>
    <ThemeToggle />
  }
}

#[component]
pub fn Layout(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <header class="absolute w-full z-30">
      <Nav />
    </header>
    <main class="font-aspekta antialiased bg-white text-slate-800 font-[350]">
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
