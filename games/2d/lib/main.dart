import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/app.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  if (kDebugMode) {
    // TODO only add this at the start of a new game and disable it when the game is not being
    // played.
    Wakelock.enable();
  }

  runApp(
    const ProviderScope(
      child: GameApp(),
    ),
  );
}
