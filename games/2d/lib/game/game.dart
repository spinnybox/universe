import 'dart:ui';
import 'package:flame/game.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spinnybox_2d/colors.dart';

import 'game_utils.dart';
export 'game_utils.dart';
import 'game_status.dart';

part 'game.g.dart';

class SpinnyBoxGame extends FlameGame {
  /// Create a game singleton instance if it doesn't already exist.
  ///
  /// If it does then reuse the previously created instance.
  factory SpinnyBoxGame() {
    return _instance ??= SpinnyBoxGame._();
  }

  SpinnyBoxGame._();

  static SpinnyBoxGame? _instance;

  /// Provides access to the the [SpinnyBoxGame] singleton.
  static SpinnyBoxGame get instance {
    final instance = _instance;

    if (instance == null) {
      throw '`SpinnyBox2DGame` accessed before creation.';
    }

    return instance;
  }

  /// Keep track of the score.
  final score = GameScore();

  /// Keep track of the current game status.
  final status = GameStatus();

  /// Provides the size and offset of the status widget when non null.
  StatusOverlayDimensions statusWidget = const StatusOverlayDimensions(
    size: Size.zero,
    offset: Offset.zero,
  );

  /// Exit game and handle cleanup tasks.
  void exit() {
    if (status.isExited) return;
    paused;

    setOverlays([]);
    status.exit();
  }

  /// Removes all overlays but adds those provivded in the list.
  void setOverlays(List<String> items) {
    for (final overlay in [
      OverlayName.tutorial,
      OverlayName.gameOver,
      OverlayName.pauseMenu,
      OverlayName.topBar
    ]) {
      if (items.contains(overlay)) {
        continue;
      }

      overlays.remove(overlay);
    }

    for (final overlay in items) {
      if (overlays.isActive(overlay)) {
        continue;
      }

      overlays.add(overlay);
    }
  }

  @override
  Color backgroundColor() => AppColors.white;
}

@riverpod
SpinnyBoxGame spinnybox2DGame(Spinnybox2DGameRef ref) {
  return SpinnyBoxGame();
}
