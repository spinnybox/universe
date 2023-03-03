use leptos::provide_context;
use leptos::use_context;
use leptos::Scope;

pub trait ContextProvider {
  type Value: Default;

  /// Provide the context value into the leptos scope if it doesn't already
  /// exist.
  fn provide(cx: Scope) -> Self
  where
    Self: Copy + Clone + 'static,
  {
    match use_context::<Self>(cx) {
      Some(context) => context,
      None => {
        let context = Self::from_leptos_scope(cx);
        provide_context::<Self>(cx, context);
        context
      }
    }
  }

  /// Generate the value of this provider from the leptos scope.
  fn from_leptos_scope(cx: Scope) -> Self;

  /// Get the value contained in the provided scope.
  fn get(&self) -> Self::Value;

  /// Set the value contained in the scope.
  fn set(&self, value: Self::Value);
}
