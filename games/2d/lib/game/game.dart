import 'dart:ui';
import 'package:flame/game.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/services/game_service.dart';

import 'game_utils.dart';
export 'game_utils.dart';
import 'game_status.dart';

part 'game.g.dart';

class SpinnyBoxGame extends FlameGame {
  SpinnyBoxGame({
    required this.gameService,
    required this.id,
  });

  /// The game id. This is used as the seed for the game with the goal of fully reproducible games.
  final String id;

  /// The game service.
  final GameService gameService;

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
SpinnyBoxGame spinnyBoxGame(SpinnyBoxGameRef ref, String id) {
  final gameService = ref.watch(gameServiceProvider);

  return SpinnyBoxGame(id: id, gameService: gameService);
}
