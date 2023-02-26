import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spinnybox_2d/models/game_data.dart';

part 'settings.g.dart';
part 'settings.freezed.dart';

const _defaultVolume = 1.0;

@freezed
class SettingsModel with _$SettingsModel {
  @Assert('musicVolume >= 0.0 && musicVolume <= 1.0')
  @Assert('soundVolume >= 0.0 && soundVolume <= 1.0')
  const factory SettingsModel({
    /// The version of the settings. Useful for migrations.
    @Default(0) int version,

    /// Whether to never show the tutorial again.
    @Default(false) bool neverShowTutorial,

    /// The volume for background music in the the game.
    /// A value between 0 (muted) and 1 (full blast).
    @Default(_defaultVolume) double musicVolume,

    /// The sound volume for the game.
    /// A value between 0 (muted) and 1 (full blast).
    @Default(_defaultVolume) double soundVolume,

    /// Whether the user has muted all music and sound.
    @Default(false) bool muted,

    // TODO move these to new player settings class

    /// Track the number of times the game has been played on this device.
    @Default(0) int numberOfPlays,

    /// Whether the user has accepted the terms and conditions yet.
    @Default(false) bool hasAcceptedTerms,

    // HIGHSCORES

    /// Store the game with the most rotations during a single game.
    GameData? highestRotations,

    /// Store the game with the most points during a single game.
    GameData? highestPoints,

    /// Store the game with the highest duration during a single game.
    GameData? highestDuration,

    /// Store the 10 most recent games.
    @Default([]) List<GameData> recentGames,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}

@riverpod
class Settings extends _$Settings {
  static const _key = '__spinnybox_2d_settings__';

  /// Load all settings. Should be run before the app starts.
  static Future<SettingsModel> loadSettings() async {
    final data = _data;

    if (data != null) {
      return data;
    }

    _preferences ??= await SharedPreferences.getInstance();
    final jsonString = _preferences?.getString(_key);
    final json = jsonDecode(jsonString ?? '{}') as Map<String, dynamic>;
    final settings = Settings();
    final newData = SettingsModel.fromJson(json);

    // _instance = Settings._(SettingsModel.fromJson(json));
    settings.state = newData;
    _data = newData;

    // If this is the first time retrieving the settings then save them.
    if (jsonString == null) {
      await settings.save(newData, force: true);
    }

    return newData;
  }

  static SettingsModel? _data;

  /// A cached version of the settings.
  static SettingsModel get data {
    final data = _data;

    if (data == null) {
      throw 'Settings accessed before initialization. Must call Settings.loadSettings() first.';
    }

    return data;
  }

  static SharedPreferences? _preferences;

  /// A cached version of the stored preferences.
  static SharedPreferences get preferences {
    final preferences = _preferences;

    if (preferences == null) {
      throw 'SharedPreferences accessed before initialization';
    }

    return preferences;
  }

  /// This will throw if not initialized.
  @override
  SettingsModel build() {
    return data;
  }

  /// Update and save the settings. Use copyWith on the settings model.
  Future<void> save(
    SettingsModel settings, {
    bool force = false,
  }) async {
    final currentJsonString = jsonEncode(state.toJson());
    final jsonString = jsonEncode(settings.toJson());

    if (currentJsonString == jsonString && !force) {
      return;
    }

    // Optimistically update the state.
    state = settings;

    // Persist the settings.
    _preferences ??= await SharedPreferences.getInstance();
    await _preferences?.setString(_key, jsonString);

    // Update the static cached data.
    _data = settings;
  }

  /// Update and save the settings. Use copyWith on the settings model.
  Future<void> update(
    SettingsUpdater updater, {
    bool force = false,
  }) async {
    final settings = updater(state);
    await save(settings, force: force);
  }
}

typedef SettingsUpdater = SettingsModel Function(SettingsModel current);
