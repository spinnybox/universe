use leptos::*;

#[component]
pub(crate) fn Button(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
      "Button"
    </button>
  }
}
