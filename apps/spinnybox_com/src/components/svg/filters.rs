use leptos::*;

#[component]
fn HanddrawnFilter(cx: Scope) -> impl IntoView {
  // <filter id="handdrawn">
  //   <feGaussianBlur in="SourceGraphic" stdDeviation="2" result="blur" />
  //   <feColorMatrix in="blur" mode="matrix" values="
  //     1 0 0 0 0
  //     0 1 0 0 0
  //     0 0 1 0 0
  //     0 0 0 25 -7
  //   " result="goo" />
  //   <feBlend in="SourceGraphic" in2="goo" />
  // </filter>
  view! {
    cx,
    <svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" style="position:absolute">
      <filter id="hand-drawn">
        <feTurbulence type="fractalNoise" baseFrequency="0.1" numOctaves="1" result="turbulence"/>
        <feDisplacementMap in="SourceGraphic" in2="turbulence" scale="5" xChannelSelector="R" yChannelSelector="G"/>
      </filter>
    </svg>
  }
}

#[component]
pub fn Filters(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <HanddrawnFilter />
  }
}
