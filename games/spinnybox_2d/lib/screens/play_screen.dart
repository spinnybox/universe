import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/game/game.dart';
import 'package:spinnybox_2d/widgets.dart';

part 'play_screen.g.dart';

@hcwidget
Widget _playScreen(
  BuildContext context,
  WidgetRef ref, {
  /// The game id. This is used as the seed for the game with the goal of fully reproducible games.
  required String id,
}) {
  // This is not a singleton, but a provider that will create a new instance whenever the id
  // changes. See if this affects performance.
  final game = ref.watch(spinnyBoxGameProvider(id));

  /// Exit the game when the widget is unmounted.
  useEffect(() => () => game.exit(), const []);

  return GameWidget(
    game: game,
    loadingBuilder: (context) => const Loading(),
    initialActiveOverlays: const [OverlayName.pauseMenu],
    overlayBuilderMap: {
      OverlayName.topBar: (_, SpinnyBoxGame game) => GameStatusOverlay(
            game: game,
          ),
      OverlayName.pauseMenu: (_, SpinnyBoxGame game) => GamePauseOverlay(
            game: game,
          ),
      OverlayName.gameOver: (_, SpinnyBoxGame game) => GameOverOverlay(
            game: game,
            message: 'Game over',
            playMessage: 'Play again',
          ),
    },
  );
}
