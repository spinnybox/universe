import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GameOverScreen extends HookWidget {
  const GameOverScreen({required this.game, super.key});

  /// The game state. Used to load the completed game state.
  final String game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'This is the GAME OVER screen.',
      ),
    );
  }
}
