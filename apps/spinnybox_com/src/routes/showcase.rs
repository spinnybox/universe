use leptos::*;
use leptos_router::*;

use crate::components::*;

#[component]
pub fn Page(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <Section class="">
      <h1>"Showcase"</h1>
      <p>"This is a showcase component!"</p>
    </Section>
  }
}
