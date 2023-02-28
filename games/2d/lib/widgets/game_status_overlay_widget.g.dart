// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_status_overlay_widget.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class GameStatusOverlay extends HookConsumerWidget {
  const GameStatusOverlay({
    Key? key,
    required this.game,
    this.shouldPause = true,
  }) : super(key: key);

  final SpinnyBoxGame game;

  final bool shouldPause;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _gameStatusOverlay(
        _context,
        game: game,
        shouldPause: shouldPause,
      );
}
