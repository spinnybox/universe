// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$$_SettingsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SettingsModel',
      json,
      ($checkedConvert) {
        final val = _$_SettingsModel(
          version: $checkedConvert('version', (v) => v as int? ?? 0),
          neverShowTutorial:
              $checkedConvert('neverShowTutorial', (v) => v as bool? ?? false),
          musicVolume: $checkedConvert(
              'musicVolume', (v) => (v as num?)?.toDouble() ?? _defaultVolume),
          soundVolume: $checkedConvert(
              'soundVolume', (v) => (v as num?)?.toDouble() ?? _defaultVolume),
          muted: $checkedConvert('muted', (v) => v as bool? ?? false),
          numberOfPlays:
              $checkedConvert('numberOfPlays', (v) => v as int? ?? 0),
          hasAcceptedTerms:
              $checkedConvert('hasAcceptedTerms', (v) => v as bool? ?? false),
          highestRotations: $checkedConvert(
              'highestRotations',
              (v) => v == null
                  ? null
                  : GameData.fromJson(v as Map<String, dynamic>)),
          highestPoints: $checkedConvert(
              'highestPoints',
              (v) => v == null
                  ? null
                  : GameData.fromJson(v as Map<String, dynamic>)),
          highestDuration: $checkedConvert(
              'highestDuration',
              (v) => v == null
                  ? null
                  : GameData.fromJson(v as Map<String, dynamic>)),
          recentGames: $checkedConvert(
              'recentGames',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => GameData.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'neverShowTutorial': instance.neverShowTutorial,
      'musicVolume': instance.musicVolume,
      'soundVolume': instance.soundVolume,
      'muted': instance.muted,
      'numberOfPlays': instance.numberOfPlays,
      'hasAcceptedTerms': instance.hasAcceptedTerms,
      'highestRotations': instance.highestRotations?.toJson(),
      'highestPoints': instance.highestPoints?.toJson(),
      'highestDuration': instance.highestDuration?.toJson(),
      'recentGames': instance.recentGames.map((e) => e.toJson()).toList(),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsHash() => r'15071facd3168ca875e66a7fe642daef5a421d34';

/// See also [Settings].
@ProviderFor(Settings)
final settingsProvider =
    AutoDisposeNotifierProvider<Settings, SettingsModel>.internal(
  Settings.new,
  name: r'settingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Settings = AutoDisposeNotifier<SettingsModel>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
