mod enemy;
mod hud;
mod player;
mod root;

use gdnative::prelude::godot_init;
use gdnative::prelude::InitHandle;

// Function that registers all exposed classes to Godot
fn init(handle: InitHandle) {
  handle.add_class::<player::Player>();
  handle.add_class::<enemy::Enemy>();
  handle.add_class::<root::Root>();
  handle.add_class::<hud::Hud>();
}

// macros that create the entry-points of the dynamic library.
godot_init!(init);
