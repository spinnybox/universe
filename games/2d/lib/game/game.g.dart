// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spinnyBoxGameHash() => r'fa6c67feade38880aa94e66bd7afc477015ad85d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef SpinnyBoxGameRef = AutoDisposeProviderRef<SpinnyBoxGame>;

/// See also [spinnyBoxGame].
@ProviderFor(spinnyBoxGame)
const spinnyBoxGameProvider = SpinnyBoxGameFamily();

/// See also [spinnyBoxGame].
class SpinnyBoxGameFamily extends Family<SpinnyBoxGame> {
  /// See also [spinnyBoxGame].
  const SpinnyBoxGameFamily();

  /// See also [spinnyBoxGame].
  SpinnyBoxGameProvider call(
    String id,
  ) {
    return SpinnyBoxGameProvider(
      id,
    );
  }

  @override
  SpinnyBoxGameProvider getProviderOverride(
    covariant SpinnyBoxGameProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'spinnyBoxGameProvider';
}

/// See also [spinnyBoxGame].
class SpinnyBoxGameProvider extends AutoDisposeProvider<SpinnyBoxGame> {
  /// See also [spinnyBoxGame].
  SpinnyBoxGameProvider(
    this.id,
  ) : super.internal(
          (ref) => spinnyBoxGame(
            ref,
            id,
          ),
          from: spinnyBoxGameProvider,
          name: r'spinnyBoxGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$spinnyBoxGameHash,
          dependencies: SpinnyBoxGameFamily._dependencies,
          allTransitiveDependencies:
              SpinnyBoxGameFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is SpinnyBoxGameProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
