import 'package:flutter/material.dart'
    show BuildContext, Color, Key, LocalKey, Page, Widget, immutable;
import 'package:go_router/go_router.dart'
    show
        CustomTransitionPage,
        GoRoute,
        GoRouteData,
        GoRouter,
        GoRouterHelper,
        GoRouterState,
        TypedGoRoute;
import 'package:spinnybox_2d/colors.dart' show AppColors;
import 'package:spinnybox_2d/widgets/widgets.dart' show CustomReveal;
import 'package:spinnybox_2d/screens/play_screen.dart' show PlayScreen;
import 'package:spinnybox_2d/screens/main_screen.dart' show MainScreen;
import 'package:spinnybox_2d/screens/settings_screen.dart' show SettingsScreen;
import 'package:spinnybox_2d/screens/game_over_screen.dart' show GameOverScreen;
import 'package:nanoid/nanoid.dart' show nanoid;

part 'router.g.dart';

@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<ShopRoute>(path: 'shop'),
  ],
)
@immutable
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen(key: Key('MainScreen'));
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildPageTransition(
      child: const SettingsScreen(key: Key('SettingsScreen')),
      color: AppColors.white,
    );
  }
}

@immutable
class ShopRoute extends GoRouteData {
  const ShopRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildPageTransition(
      child: const SettingsScreen(key: Key('ShopScreen')),
      color: AppColors.white,
    );
  }
}

@TypedGoRoute<PlayRoute>(
  path: '/play',
  routes: [
    TypedGoRoute<PlayIdRoute>(path: ':id'),
    TypedGoRoute<GameOverRoute>(path: 'end/:game'),
  ],
)
@immutable
class PlayRoute extends GoRouteData {
  const PlayRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final id = nanoid(10);

    return buildPageTransition(
      child: PlayScreen(key: const Key('PlayScreen'), id: id),
      color: AppColors.white,
    );
  }
}

@immutable
class PlayIdRoute extends GoRouteData {
  const PlayIdRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildPageTransition(
      child: PlayScreen(key: const Key('PlayScreenWithId'), id: id),
      color: AppColors.white,
    );
  }
}

/// This page will be used to show the game over screen and ads.
@immutable
class GameOverRoute extends GoRouteData {
  const GameOverRoute({required this.game});

  /// The id for the game that was played with all the data included.
  final String game;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildPageTransition(
      child: GameOverScreen(key: const Key('GameOverScreen'), game: game),
      color: AppColors.white,
    );
  }
}

CustomTransitionPage<T> buildPageTransition<T>({
  required Widget child,
  required Color color,
  String? name,
  Object? arguments,
  String? restorationId,
  LocalKey? key,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return CustomReveal(
        animation: animation,
        color: color,
        child: child,
      );
    },
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionDuration: const Duration(milliseconds: 700),
  );
}

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: true,
  initialLocation: const MainRoute().location,
);
