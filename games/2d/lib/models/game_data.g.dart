// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameData _$$_GameDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_GameData',
      json,
      ($checkedConvert) {
        final val = _$_GameData(
          score: $checkedConvert('score', (v) => v as int),
          rotations: $checkedConvert('rotations', (v) => v as int),
          duration: $checkedConvert(
              'duration', (v) => const DurationConverter().fromJson(v as int)),
          date: $checkedConvert(
              'date', (v) => const DateTimeConverter().fromJson(v as int)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'score': instance.score,
      'rotations': instance.rotations,
      'duration': const DurationConverter().toJson(instance.duration),
      'date': const DateTimeConverter().toJson(instance.date),
    };
