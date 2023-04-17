import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/converters.dart';

part 'game_utils.freezed.dart';
part 'game_utils.g.dart';

@freezed
class GameData with _$GameData {
  const factory GameData({
    required int score,
    required int rotations,
    @DurationConverter() required Duration duration,
    @DateTimeConverter() required DateTime date,
  }) = _GameData;

  factory GameData.fromJson(Map<String, dynamic> json) =>
      _$GameDataFromJson(json);
}

/// Keep track of the score of the active game.
class GameScore extends ValueNotifier<int> {
  GameScore([int score = 0]) : super(score);

  void reset() {
    value = 0;
  }

  void increment([int amount = ScoreValue.dodge]) {
    value += amount;
  }
}

class StatusOverlayDimensions {
  const StatusOverlayDimensions({
    required this.size,
    required this.offset,
  });

  final Size size;
  final Offset offset;
}

/// The scores available in the game.
class ScoreValue {
  /// The score for avoiding an barrier.
  static const dodge = 1;

  /// Default score for bumping a falling obstacle off the screen.
  static const bump = 5;

  /// The score for picking up an item.
  static const pickup = 2;
}

class OverlayName {
  static const pauseMenu = 'PauseMenu';
  static const gameOver = 'GameOver';
  static const topBar = 'TopBar';
  static const tutorial = 'Tutorial';
}
