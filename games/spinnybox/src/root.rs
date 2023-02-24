use std::f64::consts::PI;

use gdnative::api::PathFollow2D;
use gdnative::api::Position2D;
use gdnative::api::RigidBody2D;
use gdnative::godot_print;
use gdnative::prelude::methods;
use gdnative::prelude::user_data::MutexData;
use gdnative::prelude::GodotObject;
use gdnative::prelude::ManuallyManaged;
use gdnative::prelude::NativeClass;
use gdnative::prelude::Node;
use gdnative::prelude::NodeResolveExt;
use gdnative::prelude::PackedScene;
use gdnative::prelude::Ref;
use gdnative::prelude::Shared;
use gdnative::prelude::SubClass;
use gdnative::prelude::Timer;
use gdnative::prelude::Unique;
use gdnative::prelude::VariantArray;
use gdnative::prelude::Vector2;
use rand::Rng;

use crate::enemy;
use crate::hud;
use crate::player;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(MutexData<Root>)]
pub struct Root {
  #[property]
  enemy: Ref<PackedScene>,
  score: i64,
}

#[methods]
impl Root {
  fn new(_owner: &Node) -> Self {
    Root {
      enemy: PackedScene::new().into_shared(),
      score: 0,
    }
  }

  #[method]
  fn game_over(&self, #[base] owner: &Node) {
    let score_timer = unsafe { owner.get_node_as::<Timer>("score_timer").unwrap() };
    let enemy_timer = unsafe { owner.get_node_as::<Timer>("enemy_timer").unwrap() };

    score_timer.stop();
    enemy_timer.stop();

    let hud = unsafe { owner.get_node_as_instance::<hud::Hud>("hud").unwrap() };
    hud
      .map(|x, o| x.show_game_over(&o))
      .ok()
      .unwrap_or_else(|| godot_print!("Unable to get hud"));
  }

  #[method]
  fn new_game(&mut self, #[base] owner: &Node) {
    godot_print!("new_game!!!");
    let start_position = unsafe { owner.get_node_as::<Position2D>("start_position").unwrap() };
    let player = unsafe {
      owner
        .get_node_as_instance::<player::Player>("player")
        .unwrap()
    };
    let start_timer = unsafe { owner.get_node_as::<Timer>("start_timer").unwrap() };

    self.score = 0;

    player
      .map(|x, o| x.start(&o, start_position.position()))
      .ok()
      .unwrap_or_else(|| godot_print!("Unable to get player"));

    start_timer.start(0.0);

    let hud = unsafe { owner.get_node_as_instance::<hud::Hud>("hud").unwrap() };
    hud
      .map(|x, o| {
        x.update_score(&o, self.score);
        x.show_message(&o, "Get Ready".into());
      })
      .ok()
      .unwrap_or_else(|| godot_print!("Unable to get hud"));
  }

  #[method]
  fn on_start_timer_timeout(&self, #[base] owner: &Node) {
    let enemy_timer = unsafe { owner.get_node_as::<Timer>("enemy_timer").unwrap() };
    let score_timer = unsafe { owner.get_node_as::<Timer>("score_timer").unwrap() };
    enemy_timer.start(0.0);
    score_timer.start(0.0);
  }

  #[method]
  fn on_score_timer_timeout(&mut self, #[base] owner: &Node) {
    self.score += 1;

    let hud = unsafe { owner.get_node_as_instance::<hud::Hud>("hud").unwrap() };
    hud
      .map(|x, o| x.update_score(&o, self.score))
      .ok()
      .unwrap_or_else(|| godot_print!("Unable to get hud"));
  }

  #[method]
  fn on_enemy_timer_timeout(&self, #[base] owner: &Node) {
    let enemy_spawn_location = unsafe {
      owner
        .get_node_as::<PathFollow2D>("enemy_path/enemy_spawn_locations")
        .unwrap()
    };

    let enemy_scene: Ref<RigidBody2D, _> = instance_scene(&self.enemy);

    let mut rng = rand::thread_rng();
    let offset = rng.gen_range(std::u32::MIN..std::u32::MAX);

    enemy_spawn_location.set_offset(offset.into());

    let mut direction = enemy_spawn_location.rotation() + PI / 2.0;

    enemy_scene.set_position(enemy_spawn_location.position());

    direction += rng.gen_range(-PI / 4.0..PI / 4.0);
    enemy_scene.set_rotation(direction);
    let d = direction as f32;

    let enemy_scene = unsafe { enemy_scene.into_shared().assume_safe() };
    owner.add_child(enemy_scene, false);

    let enemy = enemy_scene.cast_instance::<enemy::Enemy>().unwrap();

    enemy
      .map(|x, enemy_owner| {
        enemy_owner.set_linear_velocity(Vector2::new(rng.gen_range(x.min_speed..x.max_speed), 0.0));

        enemy_owner.set_linear_velocity(enemy_owner.linear_velocity().rotated(d));

        let hud = unsafe { owner.get_node_as_instance::<hud::Hud>("hud").unwrap() };

        hud
          .map(|_, o| {
            o.connect(
              "start_game",
              enemy_owner,
              "on_start_game",
              VariantArray::new_shared(),
              0,
            )
            .unwrap();
          })
          .unwrap();
      })
      .unwrap();
  }
}

/// Root here is needs to be the same type (or a parent type) of the node that
/// you put in the child   scene as the root. For instance Spatial is used for
/// this example.
fn instance_scene<R>(scene: &Ref<PackedScene, Shared>) -> Ref<R, Unique>
where
  R: GodotObject<Memory = ManuallyManaged> + SubClass<Node>,
{
  let scene = unsafe { scene.assume_safe() };

  let instance = scene
    .instance(PackedScene::GEN_EDIT_STATE_DISABLED)
    .expect("should be able to instance scene");

  let instance = unsafe { instance.assume_unique() };

  instance
    .try_cast::<R>()
    .expect("root node type should be correct")
}
