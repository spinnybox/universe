import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/screens/router.dart';

class GameApp extends HookConsumerWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final r = router;
    return MaterialApp.router(
      title: 'SpinnyBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: r.routeInformationProvider,
      routeInformationParser: r.routeInformationParser,
      routerDelegate: r.routerDelegate,
    );
  }
}
