import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/screens/play_screen.dart' show PlayScreen;
import 'package:spinnybox_2d/screens/main_screen.dart' show MainScreen;
import 'package:spinnybox_2d/screens/settings_screen.dart' show SettingsScreen;
import 'package:spinnybox_2d/screens/game_over_screen.dart' show GameOverScreen;
import 'package:nanoid/nanoid.dart';

part 'router.g.dart';

@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    // TypedGoRoute<ModeRoute>(path: 'mode/:name'),
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
  Page<void> pageBuilder(BuildContext context, GoRouterState state) {
    return buildPageTransition(
      child: const SettingsScreen(key: Key('SettingsScreen')),
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
  String redirect(BuildContext context, GoRouterState state) =>
      PlayIdRoute(id: nanoid(10)).location;
}

@immutable
class PlayIdRoute extends GoRouteData {
  const PlayIdRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PlayScreen(key: const Key('PlayScreen'), id: id);
  }
}

/// This page will be used to show the game over screen and ads.
@immutable
class GameOverRoute extends GoRouteData {
  const GameOverRoute({required this.game});

  /// The id for the game that was played with all the data included.
  final String game;

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state) {
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
      return _CustomReveal(
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

class _CustomReveal extends HookWidget {
  final Animation<double> animation;
  final Color color;
  final Widget child;

  const _CustomReveal({
    required this.animation,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final finished = useState(false);
    final statusListener = useCallback(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          finished.value = true;
          return;
        }

        finished.value = false;
      },
      const [],
    );
    final tween = useRef(Tween(begin: const Offset(0, -1), end: Offset.zero));

    useEffect(() {
      animation.addStatusListener(statusListener);
      return () => animation.removeStatusListener(statusListener);
    }, [animation]);

    return Stack(
      fit: StackFit.expand,
      children: [
        SlideTransition(
          position: tween.value.animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
          child: Container(
            color: color,
          ),
        ),
        AnimatedOpacity(
          opacity: finished.value ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: child,
        ),
      ],
    );
  }
}

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: true,
  initialLocation: const MainRoute().location,
);
