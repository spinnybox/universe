use leptos::*;
use leptos_router::*;

use crate::components::Logo;
use crate::components::LogoProps;
use crate::components::ToggleTheme;
use crate::components::ToggleThemeProps;

#[component]
pub(crate) fn Nav(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <div class="max-w-6xl mx-auto px-4 sm:px-6">
      <div class="flex items-center justify-between h-16 md:h-20">
        <div class="shrink-0 mr-4">
          <A href="/">
            <span aria-label="SpinnyBox Logo">
              <Logo />
            </span>
          </A>
        </div>

        // Desktop Navigation
        <nav class="hidden md:flex md:flex-grow">
          // Desktop menu links
          <ul class="flex flex-grow flex-wrap flex-wrap items-center">
            <li>
              <A
                class="text-text hover:text-hoverText px-5 py-2 flex items-center transition duration-150 ease-in-out"
                href="/about"
              >
                "About"
              </A>
            </li>
          </ul>

          // Desktop right hand side CTA
          <ul class="flex justify-end flex-wrap items-center">
            <li>
              <ToggleTheme />
            </li>
          </ul>
        </nav>
        <MobileNavbar />
      </div>
    </div>
  }
}

#[component]
fn MobileNavbar(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <div class="inline-flex md:hidden">
      <ToggleTheme />
    </div>
  }
}

#[component]
fn MenuButton(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <button class="inline-flex items-center justify-center p-2 rounded-md text-text hover:text-hoverText focus:outline-none focus:bg-gray-100 transition duration-150 ease-in-out">
      <Hamburger />
    </button>
  }
}

#[component]
fn Hamburger(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <svg width="34" height="29" viewBox="0 0 34 29" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect x="1.20883" y="1.14233" width="30.9009" height="4.99413" rx="2.49706" fill="currentColor" />
      <rect x="1.20883" y="11.6887" width="30.9009" height="4.99413" rx="2.49706" fill="currentColor" />
      <rect x="1.20883" y="22.1216" width="30.9009" height="4.99413" rx="2.49706" fill="currentColor" />
      <path d="M1.72367 3.86646C1.38124 2.36194 2.04692 1.09113 4.15615 1.38841M3.88543 1C13.5304 1.60418 24.2633 2.18258 30.2589 1.36518M30.0495 1.5964C32.2156 1.05801 32.3452 2.37806 32.0236 3.13476C31.1521 4.93648 31.0793 5.86621 29.2767 5.86621M30.1983 5.80291C21.3155 6.4503 11.7353 6.05339 3.33551 5.49343M3.88543 5.52973C1.59425 5.81252 1.52903 4.27904 1.87072 3.28112" stroke="currentColor" stroke-linecap="round" />
      <path d="M1.91931 14.2018C1.46543 12.1427 4.29678 11.3251 5.3292 11.6887M4.89527 11.9135C13.6568 11.3774 25.1549 12.0091 30.0499 11.6887C31.8079 11.7461 31.7525 13.4966 31.7356 14.5433C31.5648 15.5707 31.2655 17.607 30.0499 16.7335M30.819 16.699C24.5817 17.0009 18.0838 16.7918 3.44642 15.9634M4.29917 16.2288C2.40594 15.5653 2.17671 14.6754 1.78329 13.9284" stroke="currentColor" stroke-linecap="round" />
      <path d="M1.03381 25.0727C0.693204 21.8946 3.01835 22.6116 3.74993 22.4203M3.51983 22.2407C14.1449 23.1665 24.6186 22.4436 29.8836 22.5808M30.0493 22.5757C31.5942 22.4203 32.4277 23.2486 32.4217 24.4178M32.6243 24.8457C33.0924 26.4382 32.1092 28.2508 29.1437 28.0159M30.9971 27.7794C21.5277 27.347 12.6316 26.5394 3.7971 26.8859M4.29852 27.1158C2.75338 27.1158 1.03381 26.8859 1.03381 25.2565" stroke="currentColor" stroke-linecap="round" />
    </svg>
  }
}
