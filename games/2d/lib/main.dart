import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:spinnybox_2d/app.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:spinnybox_2d/models/settings.dart';
import 'package:wakelock/wakelock.dart';

Future<void> main() async {
  await guardedMain();
}

/// Without logging and crash reporting, this would be `void main()`.
Future<void> guardedMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    // TODO only add this at the start of a new game and disable it when the game is not being
    // played.
    await Wakelock.enable();
  }

  // load settings before the app starts
  await Settings.loadSettings();
  await preloadSvgs();

  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }

  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}');
  });

  _log.info('Activating full screen mode.');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Logger _log = Logger('main.dart');
