import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

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
