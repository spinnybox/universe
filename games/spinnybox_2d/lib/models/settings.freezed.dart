// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  /// The version of the settings. Useful for migrations.
  int get version => throw _privateConstructorUsedError;

  /// Whether to never show the tutorial again.
  bool get neverShowTutorial => throw _privateConstructorUsedError;

  /// The volume for background music in the the game.
  /// A value between 0 (muted) and 1 (full blast).
  double get musicVolume => throw _privateConstructorUsedError;

  /// The sound volume for the game.
  /// A value between 0 (muted) and 1 (full blast).
  double get soundVolume => throw _privateConstructorUsedError;

  /// Whether the user has muted all music and sound.
  bool get muted =>
      throw _privateConstructorUsedError; // TODO move these to new player settings class
  /// Track the number of times the game has been played on this device.
  int get numberOfPlays => throw _privateConstructorUsedError;

  /// Whether the user has accepted the terms and conditions yet.
  bool get hasAcceptedTerms => throw _privateConstructorUsedError; // HIGHSCORES
  /// Store the game with the most rotations during a single game.
  GameData? get highestRotations => throw _privateConstructorUsedError;

  /// Store the game with the most points during a single game.
  GameData? get highestPoints => throw _privateConstructorUsedError;

  /// Store the game with the highest duration during a single game.
  GameData? get highestDuration => throw _privateConstructorUsedError;

  /// Store the 10 most recent games.
  List<GameData> get recentGames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call(
      {int version,
      bool neverShowTutorial,
      double musicVolume,
      double soundVolume,
      bool muted,
      int numberOfPlays,
      bool hasAcceptedTerms,
      GameData? highestRotations,
      GameData? highestPoints,
      GameData? highestDuration,
      List<GameData> recentGames});

  $GameDataCopyWith<$Res>? get highestRotations;
  $GameDataCopyWith<$Res>? get highestPoints;
  $GameDataCopyWith<$Res>? get highestDuration;
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? neverShowTutorial = null,
    Object? musicVolume = null,
    Object? soundVolume = null,
    Object? muted = null,
    Object? numberOfPlays = null,
    Object? hasAcceptedTerms = null,
    Object? highestRotations = freezed,
    Object? highestPoints = freezed,
    Object? highestDuration = freezed,
    Object? recentGames = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      neverShowTutorial: null == neverShowTutorial
          ? _value.neverShowTutorial
          : neverShowTutorial // ignore: cast_nullable_to_non_nullable
              as bool,
      musicVolume: null == musicVolume
          ? _value.musicVolume
          : musicVolume // ignore: cast_nullable_to_non_nullable
              as double,
      soundVolume: null == soundVolume
          ? _value.soundVolume
          : soundVolume // ignore: cast_nullable_to_non_nullable
              as double,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfPlays: null == numberOfPlays
          ? _value.numberOfPlays
          : numberOfPlays // ignore: cast_nullable_to_non_nullable
              as int,
      hasAcceptedTerms: null == hasAcceptedTerms
          ? _value.hasAcceptedTerms
          : hasAcceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      highestRotations: freezed == highestRotations
          ? _value.highestRotations
          : highestRotations // ignore: cast_nullable_to_non_nullable
              as GameData?,
      highestPoints: freezed == highestPoints
          ? _value.highestPoints
          : highestPoints // ignore: cast_nullable_to_non_nullable
              as GameData?,
      highestDuration: freezed == highestDuration
          ? _value.highestDuration
          : highestDuration // ignore: cast_nullable_to_non_nullable
              as GameData?,
      recentGames: null == recentGames
          ? _value.recentGames
          : recentGames // ignore: cast_nullable_to_non_nullable
              as List<GameData>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameDataCopyWith<$Res>? get highestRotations {
    if (_value.highestRotations == null) {
      return null;
    }

    return $GameDataCopyWith<$Res>(_value.highestRotations!, (value) {
      return _then(_value.copyWith(highestRotations: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GameDataCopyWith<$Res>? get highestPoints {
    if (_value.highestPoints == null) {
      return null;
    }

    return $GameDataCopyWith<$Res>(_value.highestPoints!, (value) {
      return _then(_value.copyWith(highestPoints: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GameDataCopyWith<$Res>? get highestDuration {
    if (_value.highestDuration == null) {
      return null;
    }

    return $GameDataCopyWith<$Res>(_value.highestDuration!, (value) {
      return _then(_value.copyWith(highestDuration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$_SettingsModelCopyWith(
          _$_SettingsModel value, $Res Function(_$_SettingsModel) then) =
      __$$_SettingsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int version,
      bool neverShowTutorial,
      double musicVolume,
      double soundVolume,
      bool muted,
      int numberOfPlays,
      bool hasAcceptedTerms,
      GameData? highestRotations,
      GameData? highestPoints,
      GameData? highestDuration,
      List<GameData> recentGames});

  @override
  $GameDataCopyWith<$Res>? get highestRotations;
  @override
  $GameDataCopyWith<$Res>? get highestPoints;
  @override
  $GameDataCopyWith<$Res>? get highestDuration;
}

/// @nodoc
class __$$_SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$_SettingsModel>
    implements _$$_SettingsModelCopyWith<$Res> {
  __$$_SettingsModelCopyWithImpl(
      _$_SettingsModel _value, $Res Function(_$_SettingsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? neverShowTutorial = null,
    Object? musicVolume = null,
    Object? soundVolume = null,
    Object? muted = null,
    Object? numberOfPlays = null,
    Object? hasAcceptedTerms = null,
    Object? highestRotations = freezed,
    Object? highestPoints = freezed,
    Object? highestDuration = freezed,
    Object? recentGames = null,
  }) {
    return _then(_$_SettingsModel(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      neverShowTutorial: null == neverShowTutorial
          ? _value.neverShowTutorial
          : neverShowTutorial // ignore: cast_nullable_to_non_nullable
              as bool,
      musicVolume: null == musicVolume
          ? _value.musicVolume
          : musicVolume // ignore: cast_nullable_to_non_nullable
              as double,
      soundVolume: null == soundVolume
          ? _value.soundVolume
          : soundVolume // ignore: cast_nullable_to_non_nullable
              as double,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfPlays: null == numberOfPlays
          ? _value.numberOfPlays
          : numberOfPlays // ignore: cast_nullable_to_non_nullable
              as int,
      hasAcceptedTerms: null == hasAcceptedTerms
          ? _value.hasAcceptedTerms
          : hasAcceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      highestRotations: freezed == highestRotations
          ? _value.highestRotations
          : highestRotations // ignore: cast_nullable_to_non_nullable
              as GameData?,
      highestPoints: freezed == highestPoints
          ? _value.highestPoints
          : highestPoints // ignore: cast_nullable_to_non_nullable
              as GameData?,
      highestDuration: freezed == highestDuration
          ? _value.highestDuration
          : highestDuration // ignore: cast_nullable_to_non_nullable
              as GameData?,
      recentGames: null == recentGames
          ? _value._recentGames
          : recentGames // ignore: cast_nullable_to_non_nullable
              as List<GameData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsModel implements _SettingsModel {
  const _$_SettingsModel(
      {this.version = 0,
      this.neverShowTutorial = false,
      this.musicVolume = _defaultVolume,
      this.soundVolume = _defaultVolume,
      this.muted = false,
      this.numberOfPlays = 0,
      this.hasAcceptedTerms = false,
      this.highestRotations,
      this.highestPoints,
      this.highestDuration,
      final List<GameData> recentGames = const []})
      : assert(musicVolume >= 0.0 && musicVolume <= 1.0),
        assert(soundVolume >= 0.0 && soundVolume <= 1.0),
        _recentGames = recentGames;

  factory _$_SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsModelFromJson(json);

  /// The version of the settings. Useful for migrations.
  @override
  @JsonKey()
  final int version;

  /// Whether to never show the tutorial again.
  @override
  @JsonKey()
  final bool neverShowTutorial;

  /// The volume for background music in the the game.
  /// A value between 0 (muted) and 1 (full blast).
  @override
  @JsonKey()
  final double musicVolume;

  /// The sound volume for the game.
  /// A value between 0 (muted) and 1 (full blast).
  @override
  @JsonKey()
  final double soundVolume;

  /// Whether the user has muted all music and sound.
  @override
  @JsonKey()
  final bool muted;
// TODO move these to new player settings class
  /// Track the number of times the game has been played on this device.
  @override
  @JsonKey()
  final int numberOfPlays;

  /// Whether the user has accepted the terms and conditions yet.
  @override
  @JsonKey()
  final bool hasAcceptedTerms;
// HIGHSCORES
  /// Store the game with the most rotations during a single game.
  @override
  final GameData? highestRotations;

  /// Store the game with the most points during a single game.
  @override
  final GameData? highestPoints;

  /// Store the game with the highest duration during a single game.
  @override
  final GameData? highestDuration;

  /// Store the 10 most recent games.
  final List<GameData> _recentGames;

  /// Store the 10 most recent games.
  @override
  @JsonKey()
  List<GameData> get recentGames {
    if (_recentGames is EqualUnmodifiableListView) return _recentGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentGames);
  }

  @override
  String toString() {
    return 'SettingsModel(version: $version, neverShowTutorial: $neverShowTutorial, musicVolume: $musicVolume, soundVolume: $soundVolume, muted: $muted, numberOfPlays: $numberOfPlays, hasAcceptedTerms: $hasAcceptedTerms, highestRotations: $highestRotations, highestPoints: $highestPoints, highestDuration: $highestDuration, recentGames: $recentGames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsModel &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.neverShowTutorial, neverShowTutorial) ||
                other.neverShowTutorial == neverShowTutorial) &&
            (identical(other.musicVolume, musicVolume) ||
                other.musicVolume == musicVolume) &&
            (identical(other.soundVolume, soundVolume) ||
                other.soundVolume == soundVolume) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.numberOfPlays, numberOfPlays) ||
                other.numberOfPlays == numberOfPlays) &&
            (identical(other.hasAcceptedTerms, hasAcceptedTerms) ||
                other.hasAcceptedTerms == hasAcceptedTerms) &&
            (identical(other.highestRotations, highestRotations) ||
                other.highestRotations == highestRotations) &&
            (identical(other.highestPoints, highestPoints) ||
                other.highestPoints == highestPoints) &&
            (identical(other.highestDuration, highestDuration) ||
                other.highestDuration == highestDuration) &&
            const DeepCollectionEquality()
                .equals(other._recentGames, _recentGames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      version,
      neverShowTutorial,
      musicVolume,
      soundVolume,
      muted,
      numberOfPlays,
      hasAcceptedTerms,
      highestRotations,
      highestPoints,
      highestDuration,
      const DeepCollectionEquality().hash(_recentGames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      __$$_SettingsModelCopyWithImpl<_$_SettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsModelToJson(
      this,
    );
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {final int version,
      final bool neverShowTutorial,
      final double musicVolume,
      final double soundVolume,
      final bool muted,
      final int numberOfPlays,
      final bool hasAcceptedTerms,
      final GameData? highestRotations,
      final GameData? highestPoints,
      final GameData? highestDuration,
      final List<GameData> recentGames}) = _$_SettingsModel;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$_SettingsModel.fromJson;

  @override

  /// The version of the settings. Useful for migrations.
  int get version;
  @override

  /// Whether to never show the tutorial again.
  bool get neverShowTutorial;
  @override

  /// The volume for background music in the the game.
  /// A value between 0 (muted) and 1 (full blast).
  double get musicVolume;
  @override

  /// The sound volume for the game.
  /// A value between 0 (muted) and 1 (full blast).
  double get soundVolume;
  @override

  /// Whether the user has muted all music and sound.
  bool get muted;
  @override // TODO move these to new player settings class
  /// Track the number of times the game has been played on this device.
  int get numberOfPlays;
  @override

  /// Whether the user has accepted the terms and conditions yet.
  bool get hasAcceptedTerms;
  @override // HIGHSCORES
  /// Store the game with the most rotations during a single game.
  GameData? get highestRotations;
  @override

  /// Store the game with the most points during a single game.
  GameData? get highestPoints;
  @override

  /// Store the game with the highest duration during a single game.
  GameData? get highestDuration;
  @override

  /// Store the 10 most recent games.
  List<GameData> get recentGames;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
