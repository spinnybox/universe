use leptos::component;
use leptos::view;
use leptos::IntoView;
use leptos::Scope;
use leptos_meta::*;

use crate::FileRoutes;
use crate::FileRoutesProps;

#[component]
pub fn Root(cx: Scope) -> impl IntoView {
  provide_meta_context(cx);

  view! {
    cx,
    <>
      <Stylesheet id="spinnybox" href="./target/site/spinnybox_com/pkg/styles.css" />
      <Title text="SpinnyBox" />
      <Meta name="description" content="Motion based mobile games." />
      <FileRoutes />
    </>
  }
}
