// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_pause_overlay_widget.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class GamePauseOverlay extends HookConsumerWidget {
  const GamePauseOverlay({
    Key? key,
    required this.game,
    this.message = 'Do you want to get started?',
    this.playMessage = 'Resume',
    this.exitMessage = 'Exit',
  }) : super(key: key);

  final SpinnyBoxGame game;

  final String message;

  final String playMessage;

  final String exitMessage;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _gamePauseOverlay(
        _context,
        _ref,
        game: game,
        message: message,
        playMessage: playMessage,
        exitMessage: exitMessage,
      );
}
