// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $mainRoute,
      $playRoute,
    ];

GoRoute get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

GoRoute get $playRoute => GoRouteData.$route(
      path: '/play',
      factory: $PlayRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $PlayIdRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'end/:game',
          factory: $GameOverRouteExtension._fromState,
        ),
      ],
    );

extension $PlayRouteExtension on PlayRoute {
  static PlayRoute _fromState(GoRouterState state) => const PlayRoute();

  String get location => GoRouteData.$location(
        '/play',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $PlayIdRouteExtension on PlayIdRoute {
  static PlayIdRoute _fromState(GoRouterState state) => PlayIdRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/play/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $GameOverRouteExtension on GameOverRoute {
  static GameOverRoute _fromState(GoRouterState state) => GameOverRoute(
        game: state.params['game']!,
      );

  String get location => GoRouteData.$location(
        '/play/end/${Uri.encodeComponent(game)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}
