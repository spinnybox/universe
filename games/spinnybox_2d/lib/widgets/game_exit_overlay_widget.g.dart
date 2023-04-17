// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_exit_overlay_widget.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class GameOverOverlay extends HookConsumerWidget {
  const GameOverOverlay({
    Key? key,
    required this.game,
    this.message = '',
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
      _gameOverOverlay(
        _context,
        game: game,
        message: message,
        playMessage: playMessage,
        exitMessage: exitMessage,
      );
}
