use leptos::*;

#[component]
pub(crate) fn Button(cx: Scope, children: Children) -> impl IntoView {
  view! {
    cx,
    <button class="hand-drawn-button">
      {children(cx)}
    </button>
  }
}
