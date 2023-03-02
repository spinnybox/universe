import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/screens/router.dart';
import 'package:spinnybox_2d/widgets.dart';

part 'app.g.dart';

@hcwidget
Widget _app(BuildContext context, WidgetRef ref) {
  return MaterialApp.router(
    title: 'SpinnyBox',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routeInformationProvider: appRouter.routeInformationProvider,
    routeInformationParser: appRouter.routeInformationParser,
    routerDelegate: appRouter.routerDelegate,
    scaffoldMessengerKey: scaffoldMessengerKey,
  );
}
