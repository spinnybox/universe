use gdnative::api::AnimatedSprite;
use gdnative::api::RigidBody2D;
use gdnative::prelude::methods;
use gdnative::prelude::user_data::MutexData;
use gdnative::prelude::GodotObject;
use gdnative::prelude::NativeClass;
use gdnative::prelude::NodeResolveExt;

#[derive(NativeClass)]
#[inherit(RigidBody2D)]
#[user_data(MutexData<Enemy>)]
pub struct Enemy {
  #[property(default = 150.0)]
  pub min_speed: f32,
  #[property(default = 250.0)]
  pub max_speed: f32,
}

#[methods]
impl Enemy {
  fn new(_owner: &RigidBody2D) -> Self {
    Enemy {
      min_speed: 150.0,
      max_speed: 250.0,
    }
  }

  #[method]
  fn _ready(&mut self, #[base] owner: &RigidBody2D) {
    let animated_sprite = unsafe {
      owner
        .get_node_as::<AnimatedSprite>("animated_sprite")
        .unwrap()
    };

    animated_sprite.set_animation("main");
  }

  #[method]
  fn on_visibility_screen_exited(&self, #[base] owner: &RigidBody2D) {
    unsafe {
      owner.assume_unique().queue_free();
    }
  }

  #[method]
  fn on_start_game(&self, #[base] owner: &RigidBody2D) {
    unsafe {
      owner.assume_unique().queue_free();
    }
  }
}
