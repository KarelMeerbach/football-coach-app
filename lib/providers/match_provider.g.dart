// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMatchesFromCompetitionIdHash() =>
    r'ae928bd4f7f322089eb861b92de143d9d992adaf';

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

/// See also [getMatchesFromCompetitionId].
@ProviderFor(getMatchesFromCompetitionId)
const getMatchesFromCompetitionIdProvider = GetMatchesFromCompetitionIdFamily();

/// See also [getMatchesFromCompetitionId].
class GetMatchesFromCompetitionIdFamily
    extends Family<AsyncValue<List<Match>>> {
  /// See also [getMatchesFromCompetitionId].
  const GetMatchesFromCompetitionIdFamily();

  /// See also [getMatchesFromCompetitionId].
  GetMatchesFromCompetitionIdProvider call(
    int comp_id,
  ) {
    return GetMatchesFromCompetitionIdProvider(
      comp_id,
    );
  }

  @override
  GetMatchesFromCompetitionIdProvider getProviderOverride(
    covariant GetMatchesFromCompetitionIdProvider provider,
  ) {
    return call(
      provider.comp_id,
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
  String? get name => r'getMatchesFromCompetitionIdProvider';
}

/// See also [getMatchesFromCompetitionId].
class GetMatchesFromCompetitionIdProvider
    extends AutoDisposeFutureProvider<List<Match>> {
  /// See also [getMatchesFromCompetitionId].
  GetMatchesFromCompetitionIdProvider(
    int comp_id,
  ) : this._internal(
          (ref) => getMatchesFromCompetitionId(
            ref as GetMatchesFromCompetitionIdRef,
            comp_id,
          ),
          from: getMatchesFromCompetitionIdProvider,
          name: r'getMatchesFromCompetitionIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMatchesFromCompetitionIdHash,
          dependencies: GetMatchesFromCompetitionIdFamily._dependencies,
          allTransitiveDependencies:
              GetMatchesFromCompetitionIdFamily._allTransitiveDependencies,
          comp_id: comp_id,
        );

  GetMatchesFromCompetitionIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.comp_id,
  }) : super.internal();

  final int comp_id;

  @override
  Override overrideWith(
    FutureOr<List<Match>> Function(GetMatchesFromCompetitionIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMatchesFromCompetitionIdProvider._internal(
        (ref) => create(ref as GetMatchesFromCompetitionIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        comp_id: comp_id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Match>> createElement() {
    return _GetMatchesFromCompetitionIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMatchesFromCompetitionIdProvider &&
        other.comp_id == comp_id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, comp_id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMatchesFromCompetitionIdRef
    on AutoDisposeFutureProviderRef<List<Match>> {
  /// The parameter `comp_id` of this provider.
  int get comp_id;
}

class _GetMatchesFromCompetitionIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Match>>
    with GetMatchesFromCompetitionIdRef {
  _GetMatchesFromCompetitionIdProviderElement(super.provider);

  @override
  int get comp_id => (origin as GetMatchesFromCompetitionIdProvider).comp_id;
}

String _$getMatchByIdHash() => r'400f60b80880d59e8080031478b8a27534aab20a';

/// See also [getMatchById].
@ProviderFor(getMatchById)
const getMatchByIdProvider = GetMatchByIdFamily();

/// See also [getMatchById].
class GetMatchByIdFamily extends Family<AsyncValue<Match>> {
  /// See also [getMatchById].
  const GetMatchByIdFamily();

  /// See also [getMatchById].
  GetMatchByIdProvider call(
    int match_id,
  ) {
    return GetMatchByIdProvider(
      match_id,
    );
  }

  @override
  GetMatchByIdProvider getProviderOverride(
    covariant GetMatchByIdProvider provider,
  ) {
    return call(
      provider.match_id,
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
  String? get name => r'getMatchByIdProvider';
}

/// See also [getMatchById].
class GetMatchByIdProvider extends AutoDisposeFutureProvider<Match> {
  /// See also [getMatchById].
  GetMatchByIdProvider(
    int match_id,
  ) : this._internal(
          (ref) => getMatchById(
            ref as GetMatchByIdRef,
            match_id,
          ),
          from: getMatchByIdProvider,
          name: r'getMatchByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMatchByIdHash,
          dependencies: GetMatchByIdFamily._dependencies,
          allTransitiveDependencies:
              GetMatchByIdFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  GetMatchByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.match_id,
  }) : super.internal();

  final int match_id;

  @override
  Override overrideWith(
    FutureOr<Match> Function(GetMatchByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMatchByIdProvider._internal(
        (ref) => create(ref as GetMatchByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        match_id: match_id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Match> createElement() {
    return _GetMatchByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMatchByIdProvider && other.match_id == match_id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, match_id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMatchByIdRef on AutoDisposeFutureProviderRef<Match> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _GetMatchByIdProviderElement
    extends AutoDisposeFutureProviderElement<Match> with GetMatchByIdRef {
  _GetMatchByIdProviderElement(super.provider);

  @override
  int get match_id => (origin as GetMatchByIdProvider).match_id;
}

String _$finishMatchByIdHash() => r'a948893d4af0b1082aaa2581182aaa2245991f8d';

/// See also [finishMatchById].
@ProviderFor(finishMatchById)
const finishMatchByIdProvider = FinishMatchByIdFamily();

/// See also [finishMatchById].
class FinishMatchByIdFamily extends Family<AsyncValue<void>> {
  /// See also [finishMatchById].
  const FinishMatchByIdFamily();

  /// See also [finishMatchById].
  FinishMatchByIdProvider call(
    int match_id,
  ) {
    return FinishMatchByIdProvider(
      match_id,
    );
  }

  @override
  FinishMatchByIdProvider getProviderOverride(
    covariant FinishMatchByIdProvider provider,
  ) {
    return call(
      provider.match_id,
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
  String? get name => r'finishMatchByIdProvider';
}

/// See also [finishMatchById].
class FinishMatchByIdProvider extends AutoDisposeFutureProvider<void> {
  /// See also [finishMatchById].
  FinishMatchByIdProvider(
    int match_id,
  ) : this._internal(
          (ref) => finishMatchById(
            ref as FinishMatchByIdRef,
            match_id,
          ),
          from: finishMatchByIdProvider,
          name: r'finishMatchByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finishMatchByIdHash,
          dependencies: FinishMatchByIdFamily._dependencies,
          allTransitiveDependencies:
              FinishMatchByIdFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  FinishMatchByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.match_id,
  }) : super.internal();

  final int match_id;

  @override
  Override overrideWith(
    FutureOr<void> Function(FinishMatchByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinishMatchByIdProvider._internal(
        (ref) => create(ref as FinishMatchByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        match_id: match_id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FinishMatchByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinishMatchByIdProvider && other.match_id == match_id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, match_id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FinishMatchByIdRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _FinishMatchByIdProviderElement
    extends AutoDisposeFutureProviderElement<void> with FinishMatchByIdRef {
  _FinishMatchByIdProviderElement(super.provider);

  @override
  int get match_id => (origin as FinishMatchByIdProvider).match_id;
}

String _$createMatchHash() => r'668ecf226357a421b8e493aa1b98512c92e59be8';

/// See also [createMatch].
@ProviderFor(createMatch)
const createMatchProvider = CreateMatchFamily();

/// See also [createMatch].
class CreateMatchFamily extends Family<AsyncValue<void>> {
  /// See also [createMatch].
  const CreateMatchFamily();

  /// See also [createMatch].
  CreateMatchProvider call(
    Match match,
  ) {
    return CreateMatchProvider(
      match,
    );
  }

  @override
  CreateMatchProvider getProviderOverride(
    covariant CreateMatchProvider provider,
  ) {
    return call(
      provider.match,
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
  String? get name => r'createMatchProvider';
}

/// See also [createMatch].
class CreateMatchProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createMatch].
  CreateMatchProvider(
    Match match,
  ) : this._internal(
          (ref) => createMatch(
            ref as CreateMatchRef,
            match,
          ),
          from: createMatchProvider,
          name: r'createMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createMatchHash,
          dependencies: CreateMatchFamily._dependencies,
          allTransitiveDependencies:
              CreateMatchFamily._allTransitiveDependencies,
          match: match,
        );

  CreateMatchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.match,
  }) : super.internal();

  final Match match;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateMatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateMatchProvider._internal(
        (ref) => create(ref as CreateMatchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        match: match,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateMatchProvider && other.match == match;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, match.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateMatchRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `match` of this provider.
  Match get match;
}

class _CreateMatchProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateMatchRef {
  _CreateMatchProviderElement(super.provider);

  @override
  Match get match => (origin as CreateMatchProvider).match;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
