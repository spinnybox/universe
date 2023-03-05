use leptos::*;

#[component]
pub(crate) fn Section(
  cx: Scope,
  /// The content of the section
  children: Children,
  /// Additional classes for this section
  #[prop(optional, into)]
  class: Option<MaybeSignal<String>>,
  /// Additional classes for the section wrapper
  #[prop(optional, into)]
  wrapper_class: Option<MaybeSignal<String>>,
) -> impl IntoView {
  let wrapper_classes = move || {
    let mut classes = String::from("py-12 relative");

    if let Some(class) = wrapper_class.as_ref() {
      classes = format!("{} {}", classes, class());
    }

    classes
  };

  let classes = move || {
    let mut classes = String::from("max-w-6xl mx-auto px-4 sm:px-10");

    if let Some(class) = class.as_ref() {
      classes = format!("{} {}", classes, class());
    }

    classes
  };

  view! {
    cx,
    <section class=wrapper_classes>
      <div class=classes>
        {children(cx)}
      </div>
    </section>
  }
}
