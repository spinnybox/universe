// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_utils.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return _GameData.fromJson(json);
}

/// @nodoc
mixin _$GameData {
  int get score => throw _privateConstructorUsedError;
  int get rotations => throw _privateConstructorUsedError;
  @DurationConverter()
  Duration get duration => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDataCopyWith<GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDataCopyWith<$Res> {
  factory $GameDataCopyWith(GameData value, $Res Function(GameData) then) =
      _$GameDataCopyWithImpl<$Res, GameData>;
  @useResult
  $Res call(
      {int score,
      int rotations,
      @DurationConverter() Duration duration,
      @DateTimeConverter() DateTime date});
}

/// @nodoc
class _$GameDataCopyWithImpl<$Res, $Val extends GameData>
    implements $GameDataCopyWith<$Res> {
  _$GameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? rotations = null,
    Object? duration = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rotations: null == rotations
          ? _value.rotations
          : rotations // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameDataCopyWith<$Res> implements $GameDataCopyWith<$Res> {
  factory _$$_GameDataCopyWith(
          _$_GameData value, $Res Function(_$_GameData) then) =
      __$$_GameDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int score,
      int rotations,
      @DurationConverter() Duration duration,
      @DateTimeConverter() DateTime date});
}

/// @nodoc
class __$$_GameDataCopyWithImpl<$Res>
    extends _$GameDataCopyWithImpl<$Res, _$_GameData>
    implements _$$_GameDataCopyWith<$Res> {
  __$$_GameDataCopyWithImpl(
      _$_GameData _value, $Res Function(_$_GameData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? rotations = null,
    Object? duration = null,
    Object? date = null,
  }) {
    return _then(_$_GameData(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rotations: null == rotations
          ? _value.rotations
          : rotations // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameData implements _GameData {
  const _$_GameData(
      {required this.score,
      required this.rotations,
      @DurationConverter() required this.duration,
      @DateTimeConverter() required this.date});

  factory _$_GameData.fromJson(Map<String, dynamic> json) =>
      _$$_GameDataFromJson(json);

  @override
  final int score;
  @override
  final int rotations;
  @override
  @DurationConverter()
  final Duration duration;
  @override
  @DateTimeConverter()
  final DateTime date;

  @override
  String toString() {
    return 'GameData(score: $score, rotations: $rotations, duration: $duration, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameData &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rotations, rotations) ||
                other.rotations == rotations) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, score, rotations, duration, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      __$$_GameDataCopyWithImpl<_$_GameData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameDataToJson(
      this,
    );
  }
}

abstract class _GameData implements GameData {
  const factory _GameData(
      {required final int score,
      required final int rotations,
      @DurationConverter() required final Duration duration,
      @DateTimeConverter() required final DateTime date}) = _$_GameData;

  factory _GameData.fromJson(Map<String, dynamic> json) = _$_GameData.fromJson;

  @override
  int get score;
  @override
  int get rotations;
  @override
  @DurationConverter()
  Duration get duration;
  @override
  @DateTimeConverter()
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      throw _privateConstructorUsedError;
}
