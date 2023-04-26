import 'dart:async';

import 'package:games_services/games_services.dart' as gs;
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spinnybox_2d/game/game.dart';

part 'game_service.g.dart';

/// Allows awarding achievements and leaderboard scores,
/// and also showing the platforms' UI overlays for achievements
/// and leaderboards.
///
/// A facade of `package:games_services`.
///
/// Adapted from https://github.com/flutter/samples/blob/7874e554b6c75d56bc793f9643512a848758dd59/game_template/lib/src/games_services/games_services.dart#L17-L119
@riverpod
class GameService extends _$GameService {
  static final Logger _log = Logger('GameService');

  @override
  GameService build() {
    return this;
  }

  final Completer<bool> _signedInCompleter = Completer();

  // ignore: avoid_public_notifier_properties
  Future<bool> get signedIn => _signedInCompleter.future;

  /// Unlocks an achievement on Game Center / Play Games.
  ///
  /// You must provide the achievement ids via the [iOS] and [android]
  /// parameters.
  ///
  /// Does nothing when the game isn't signed into the underlying
  /// games service.
  Future<void> awardAchievement(AchievementName achievement) async {
    if (!await signedIn) {
      _log.warning('Trying to award achievement when not logged in.');
      return;
    }

    try {
      await gs.GamesServices.unlock(
        achievement: gs.Achievement(
          androidID: achievement.android,
          iOSID: achievement.ios,
        ),
      );
    } catch (e) {
      _log.severe('Cannot award achievement: $e');
    }
  }

  /// Signs into the underlying games service.
  Future<void> initialize() async {
    try {
      await gs.GamesServices.signIn();
      // The API is unclear so we're checking to be sure. The above call
      // returns a String, not a boolean, and there's no documentation
      // as to whether every non-error result means we're safely signed in.
      final signedIn = await gs.GamesServices.isSignedIn;
      _signedInCompleter.complete(signedIn);
    } catch (e) {
      _log.severe('Cannot log into GamesServices: $e');
      _signedInCompleter.complete(false);
    }
  }

  /// Launches the platform's UI overlay with achievements.
  Future<void> showAchievements() async {
    if (!await signedIn) {
      _log.severe('Trying to show achievements when not logged in.');
      return;
    }

    try {
      await gs.GamesServices.showAchievements();
    } catch (e) {
      _log.severe('Cannot show achievements: $e');
    }
  }

  /// Launches the platform's UI overlay with leaderboard(s).
  Future<void> showWeeklyLeaderboard() async {
    if (!await signedIn) {
      _log.severe('Trying to show leaderboard when not logged in.');
      return;
    }

    try {
      await gs.GamesServices.showLeaderboards(
        iOSLeaderboardID: weeklyLeaderboardId,
        androidLeaderboardID: weeklyLeaderboardId,
      );
    } catch (e) {
      _log.severe('Cannot show leaderboard: $e');
    }
  }

  /// Submits [score] to the leaderboard.
  Future<void> submitWeeklyLeaderboardScore(GameData data) async {
    if (!await signedIn) {
      _log.warning('Trying to submit leaderboard when not logged in.');
      return;
    }

    _log.info('Submitting ${data.score} to leaderboard.');

    try {
      await gs.GamesServices.submitScore(
        score: gs.Score(
          iOSLeaderboardID: weeklyLeaderboardId,
          androidLeaderboardID: weeklyLeaderboardId,
          value: data.score,
        ),
      );
    } catch (e) {
      _log.severe('Cannot submit weekly leaderboard score: $e');
    }
  }
}

const weeklyLeaderboardId = 'weeklyTopScores';

class AchievementName {
  const AchievementName({required this.android, required this.ios});
  const AchievementName.shared(String name) : this(android: name, ios: name);

  final String android;
  final String ios;
}

class Achievement {
  static const firstRotation = AchievementName.shared('firstRotation');
}
