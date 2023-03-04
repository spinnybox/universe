use leptos::*;
use leptos_meta::Link;
use leptos_meta::*;

use crate::FileRoutes;
use crate::FileRoutesProps;

#[component]
pub fn Root(cx: Scope) -> impl IntoView {
  provide_meta_context(cx);

  view! {
    cx,
    <Stylesheet id="leptos" href="/pkg/spinnybox_com.css" />
    <Body class="font-inter antialiased bg-white text-gray-900 tracking-tight" />
    <Title text="SpinnyBox" />
    <Meta name="description" content="Motion based mobile games." />
    <Link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
    <Link rel="icon" type_="image/png" sizes="32x32" href="/favicon-32x32.png" />
    <Link rel="icon" type_="image/png" sizes="16x16" href="/favicon-16x16.png" />
    <Link rel="manifest" href="/site.webmanifest" />
    <FileRoutes />
  }
}
