import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlayScreen extends HookWidget {
  const PlayScreen({Key? key, required this.id}) : super(key: key);

  /// The game id. This is used as the seed for the game with the goal of fully reproducible games.
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'This is the PlayScreen screen with $id',
      ),
    );
  }
}
