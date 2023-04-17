// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameServiceHash() => r'33c0c980564740d59e9e519083f09c94781839a5';

/// Allows awarding achievements and leaderboard scores,
/// and also showing the platforms' UI overlays for achievements
/// and leaderboards.
///
/// A facade of `package:games_services`.
///
/// Adapted from https://github.com/flutter/samples/blob/7874e554b6c75d56bc793f9643512a848758dd59/game_template/lib/src/games_services/games_services.dart#L17-L119
///
/// Copied from [GameService].
@ProviderFor(GameService)
final gameServiceProvider =
    AutoDisposeNotifierProvider<GameService, GameService>.internal(
  GameService.new,
  name: r'gameServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gameServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameService = AutoDisposeNotifier<GameService>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
