use leptos::*;
use leptos_meta::Link;
use leptos_meta::*;

use crate::components::Filters;
use crate::components::FiltersProps;
use crate::FileRoutes;
use crate::FileRoutesProps;

#[component]
pub fn Root(cx: Scope) -> impl IntoView {
  provide_meta_context(cx);

  view! {
    cx,
    <Stylesheet id="leptos" href="/pkg/spinnybox_com.css" />
    <Title text="SpinnyBox" />
    <Meta name="description" content="Motion based mobile games." />
    <Link rel="apple-touch-icon" sizes="180x180" href="/images/apple-touch-icon.png" />
    <Link rel="icon" type_="image/png" sizes="32x32" href="/images/favicon-32x32.png" />
    <Link rel="icon" type_="image/png" sizes="16x16" href="/images/favicon-16x16.png" />
    <Link rel="manifest" href="/site.webmanifest" />
    <Body class="font-main antialiased bg-white text-text tracking-tight min-h-screen prose min-w-screen w-screen" />
    <Filters />
    <FileRoutes />
  }
}
