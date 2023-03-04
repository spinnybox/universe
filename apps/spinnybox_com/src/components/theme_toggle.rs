use leptos::*;
use leptos_meta::*;
use leptos_router::*;

use crate::ColorTheme;
use crate::CookieDataContext;

#[server(SetTheme, "/rpc")]
pub async fn set_theme(cx: Scope, theme: ColorTheme) -> Result<ColorTheme, ServerFnError> {
  let mut cookie_data_context = CookieDataContext::from(cx);
  cookie_data_context.set_theme(theme);
  log!("Saving cookie! {:#?}", cookie_data_context.data);
  cookie_data_context.save();

  Ok(theme)
}

fn initial_theme(cx: Scope) -> ColorTheme {
  // CookieDataContext::from(cx).theme()
  cfg_if::cfg_if! {
    if #[cfg(feature = "ssr")] {
      log!("SERVER: INITIAL THEME !!!!");
      use_context::<CookieDataContext>(cx)
        .map(|data| data.theme())
        .unwrap_or(ColorTheme::default())

    } else if #[cfg(target_arch = "wasm32")] {
      log!("WASM: INITIAL THEME !!!!");
      CookieDataContext::from(cx).theme()
    } else {
      log!("OTHER: INITIAL THEME !!!!");
      ColorTheme::default()
    }
  }
}

#[component]
pub fn ThemeToggle(cx: Scope) -> impl IntoView {
  let initial = initial_theme(cx);
  let set_theme_action = create_server_action::<SetTheme>(cx);
  let input = set_theme_action.input();
  let value = set_theme_action.value();
  let theme = move || {
    match (input(), value()) {
      (Some(submission), _) => submission.theme,
      (_, Some(Ok(value))) => value,
      _ => initial,
    }
  };
  let theme_string = move || theme().to_string();
  let toggled_theme_string = move || theme().toggle().to_string();
  let switcher = move || {
    if theme() == ColorTheme::Dark {
      "Switch to Light Mode"
    } else {
      "Switch to Dark Mode"
    }
  };

  view! {
    cx,
    <Html class={theme_string} />
    <ActionForm action={set_theme_action}>
      <input type="hidden" name="theme" value=toggled_theme_string />
      <input type ="submit" value=switcher />
    </ActionForm>
  }
}
