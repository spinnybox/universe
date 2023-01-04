use leptos::component;
use leptos::view;
use leptos::IntoView;
use leptos::Scope;
use leptos_router::*;

#[component]
pub fn Nav(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <nav class="inner">
      <A href="/">
        <strong>"SpinnyBox"</strong>
      </A>
    </nav>
  }
}
