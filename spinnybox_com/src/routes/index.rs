use leptos::*;
use leptos_router::*;

#[component]
pub fn Page(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <>
      <h1>"Index"</h1>
      <p>"This is the main page"</p>
    </>
  }
}

#[component]
pub fn Layout(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <>
      <header>
        <nav>
          <A href="/">
            <span>"Main"</span>
          </A>
        </nav>
      </header>
      <main>
        <Outlet />
      </main>
    </>
  }
}

#[component]
pub fn NotFound(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <>
      <h1>"Page not found"</h1>
    </>
  }
}
