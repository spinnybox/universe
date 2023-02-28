import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef DispatchStateChange = void Function(GameState previousGameState);

class GameStatus extends StateNotifier<GameState> {
  GameStatus() : super(GameState.exited);

  late GameState _prevGameState = state;
  late GameState _gameState = state;
  bool _stateChanged = false;

  /// The current state of the active game.
  GameState get value => state;

  /// The default status for the game.
  bool get isReady => state == GameState.ready;

  /// True when the game has been exited.
  bool get isExited => state == GameState.exited;

  /// True when the player just lost a game.
  bool get isEnded => state == GameState.ended;

  // Playing States

  /// True when the game is currently being played.
  bool get isPlaying => state == GameState.playingGame;

  /// When the game is paused in some way
  bool get isPaused => state == GameState.pausedGame;

  /// True when the game is either playing or paused.
  bool get isActive => isPlaying || isPaused;

  /// Call this to trigger the state change handler property.
  ///
  /// The callback is called when the state has changed in the most recent step.
  void update([DispatchStateChange? callback]) {
    if (!_stateChanged) {
      return;
    }

    if (callback != null) callback(_prevGameState);

    _stateChanged = false;

    // Will trigger an update.
    state = _gameState;
  }

  void launch() {
    _update(GameState.ready);
  }

  void exit() {
    _update(GameState.exited);
  }

  void end() {
    _update(GameState.ended);
  }

  void play() {
    _update(GameState.playingGame);
  }

  void pause() {
    _update(GameState.pausedGame);
  }

  void _update(GameState gameState) {
    _stateChanged = gameState != _gameState;
    _prevGameState = _gameState;
    _gameState = gameState;
    state = gameState;
  }
}

enum GameState {
  // Standalone States

  /// The player has died.
  ended,

  /// The game has been exited and all components have been removed.
  ///
  /// This is called when navigating away from the [PlayScreen].
  exited,

  /// Indicates the game has been launched but isn't yet in a playable state.
  ///
  /// The default state which is set as soon as the game is navigated to.
  ready,

  // Playing States

  /// A game is currently being played.
  ///
  /// This is marked as a [GameStateGetters.isActive] state.
  playingGame,

  // Paused States

  /// The user has paused the game and there are no more updates happening.
  ///
  /// This is marked as a [GameStateGetters.isActive] state since the game is ongoing.
  pausedGame,
}
