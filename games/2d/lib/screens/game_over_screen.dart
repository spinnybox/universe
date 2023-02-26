import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/widgets/widgets.dart';

part 'game_over_screen.g.dart';

@swidget
Widget _gameOverScreen(
  BuildContext context, {
  /// The game state. Used to load the completed game state.
  required String game,
}) {
  return MainLayout(
    child: Text('This is the GAME OVER screen. $game'),
  );
}
