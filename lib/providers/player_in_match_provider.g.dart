// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_in_match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$insertPlayerIntoMatchHash() =>
    r'2749378c4441fded232df76aeb750174a9a44321';

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

/// See also [insertPlayerIntoMatch].
@ProviderFor(insertPlayerIntoMatch)
const insertPlayerIntoMatchProvider = InsertPlayerIntoMatchFamily();

/// See also [insertPlayerIntoMatch].
class InsertPlayerIntoMatchFamily extends Family<AsyncValue<void>> {
  /// See also [insertPlayerIntoMatch].
  const InsertPlayerIntoMatchFamily();

  /// See also [insertPlayerIntoMatch].
  InsertPlayerIntoMatchProvider call(
    List<PlayerInMatch> playersInMatch,
  ) {
    return InsertPlayerIntoMatchProvider(
      playersInMatch,
    );
  }

  @override
  InsertPlayerIntoMatchProvider getProviderOverride(
    covariant InsertPlayerIntoMatchProvider provider,
  ) {
    return call(
      provider.playersInMatch,
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
  String? get name => r'insertPlayerIntoMatchProvider';
}

/// See also [insertPlayerIntoMatch].
class InsertPlayerIntoMatchProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertPlayerIntoMatch].
  InsertPlayerIntoMatchProvider(
    List<PlayerInMatch> playersInMatch,
  ) : this._internal(
          (ref) => insertPlayerIntoMatch(
            ref as InsertPlayerIntoMatchRef,
            playersInMatch,
          ),
          from: insertPlayerIntoMatchProvider,
          name: r'insertPlayerIntoMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertPlayerIntoMatchHash,
          dependencies: InsertPlayerIntoMatchFamily._dependencies,
          allTransitiveDependencies:
              InsertPlayerIntoMatchFamily._allTransitiveDependencies,
          playersInMatch: playersInMatch,
        );

  InsertPlayerIntoMatchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playersInMatch,
  }) : super.internal();

  final List<PlayerInMatch> playersInMatch;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertPlayerIntoMatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertPlayerIntoMatchProvider._internal(
        (ref) => create(ref as InsertPlayerIntoMatchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playersInMatch: playersInMatch,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertPlayerIntoMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertPlayerIntoMatchProvider &&
        other.playersInMatch == playersInMatch;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playersInMatch.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InsertPlayerIntoMatchRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `playersInMatch` of this provider.
  List<PlayerInMatch> get playersInMatch;
}

class _InsertPlayerIntoMatchProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with InsertPlayerIntoMatchRef {
  _InsertPlayerIntoMatchProviderElement(super.provider);

  @override
  List<PlayerInMatch> get playersInMatch =>
      (origin as InsertPlayerIntoMatchProvider).playersInMatch;
}

String _$getAllStartingPlayersInMatchHash() =>
    r'5d5be8a19678ae73c4c665b6974fae708acac170';

/// See also [getAllStartingPlayersInMatch].
@ProviderFor(getAllStartingPlayersInMatch)
const getAllStartingPlayersInMatchProvider =
    GetAllStartingPlayersInMatchFamily();

/// See also [getAllStartingPlayersInMatch].
class GetAllStartingPlayersInMatchFamily
    extends Family<AsyncValue<List<Player>>> {
  /// See also [getAllStartingPlayersInMatch].
  const GetAllStartingPlayersInMatchFamily();

  /// See also [getAllStartingPlayersInMatch].
  GetAllStartingPlayersInMatchProvider call(
    int match_id,
  ) {
    return GetAllStartingPlayersInMatchProvider(
      match_id,
    );
  }

  @override
  GetAllStartingPlayersInMatchProvider getProviderOverride(
    covariant GetAllStartingPlayersInMatchProvider provider,
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
  String? get name => r'getAllStartingPlayersInMatchProvider';
}

/// See also [getAllStartingPlayersInMatch].
class GetAllStartingPlayersInMatchProvider
    extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [getAllStartingPlayersInMatch].
  GetAllStartingPlayersInMatchProvider(
    int match_id,
  ) : this._internal(
          (ref) => getAllStartingPlayersInMatch(
            ref as GetAllStartingPlayersInMatchRef,
            match_id,
          ),
          from: getAllStartingPlayersInMatchProvider,
          name: r'getAllStartingPlayersInMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllStartingPlayersInMatchHash,
          dependencies: GetAllStartingPlayersInMatchFamily._dependencies,
          allTransitiveDependencies:
              GetAllStartingPlayersInMatchFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  GetAllStartingPlayersInMatchProvider._internal(
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
    FutureOr<List<Player>> Function(GetAllStartingPlayersInMatchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllStartingPlayersInMatchProvider._internal(
        (ref) => create(ref as GetAllStartingPlayersInMatchRef),
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
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _GetAllStartingPlayersInMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllStartingPlayersInMatchProvider &&
        other.match_id == match_id;
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
mixin GetAllStartingPlayersInMatchRef
    on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _GetAllStartingPlayersInMatchProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with GetAllStartingPlayersInMatchRef {
  _GetAllStartingPlayersInMatchProviderElement(super.provider);

  @override
  int get match_id => (origin as GetAllStartingPlayersInMatchProvider).match_id;
}

String _$getAllPlayersInMatchHash() =>
    r'118846bef4f5f245fe91afae5abed52ed6e0304f';

/// See also [getAllPlayersInMatch].
@ProviderFor(getAllPlayersInMatch)
const getAllPlayersInMatchProvider = GetAllPlayersInMatchFamily();

/// See also [getAllPlayersInMatch].
class GetAllPlayersInMatchFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [getAllPlayersInMatch].
  const GetAllPlayersInMatchFamily();

  /// See also [getAllPlayersInMatch].
  GetAllPlayersInMatchProvider call(
    int match_id,
  ) {
    return GetAllPlayersInMatchProvider(
      match_id,
    );
  }

  @override
  GetAllPlayersInMatchProvider getProviderOverride(
    covariant GetAllPlayersInMatchProvider provider,
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
  String? get name => r'getAllPlayersInMatchProvider';
}

/// See also [getAllPlayersInMatch].
class GetAllPlayersInMatchProvider
    extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [getAllPlayersInMatch].
  GetAllPlayersInMatchProvider(
    int match_id,
  ) : this._internal(
          (ref) => getAllPlayersInMatch(
            ref as GetAllPlayersInMatchRef,
            match_id,
          ),
          from: getAllPlayersInMatchProvider,
          name: r'getAllPlayersInMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllPlayersInMatchHash,
          dependencies: GetAllPlayersInMatchFamily._dependencies,
          allTransitiveDependencies:
              GetAllPlayersInMatchFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  GetAllPlayersInMatchProvider._internal(
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
    FutureOr<List<Player>> Function(GetAllPlayersInMatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllPlayersInMatchProvider._internal(
        (ref) => create(ref as GetAllPlayersInMatchRef),
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
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _GetAllPlayersInMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllPlayersInMatchProvider && other.match_id == match_id;
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
mixin GetAllPlayersInMatchRef on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _GetAllPlayersInMatchProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with GetAllPlayersInMatchRef {
  _GetAllPlayersInMatchProviderElement(super.provider);

  @override
  int get match_id => (origin as GetAllPlayersInMatchProvider).match_id;
}

String _$getAllPlayersInMatchInMatchHash() =>
    r'9be53d0e4fe26eccf084e7989c540100b816f924';

/// See also [getAllPlayersInMatchInMatch].
@ProviderFor(getAllPlayersInMatchInMatch)
const getAllPlayersInMatchInMatchProvider = GetAllPlayersInMatchInMatchFamily();

/// See also [getAllPlayersInMatchInMatch].
class GetAllPlayersInMatchInMatchFamily
    extends Family<AsyncValue<List<PlayerInMatch>>> {
  /// See also [getAllPlayersInMatchInMatch].
  const GetAllPlayersInMatchInMatchFamily();

  /// See also [getAllPlayersInMatchInMatch].
  GetAllPlayersInMatchInMatchProvider call(
    int match_id,
  ) {
    return GetAllPlayersInMatchInMatchProvider(
      match_id,
    );
  }

  @override
  GetAllPlayersInMatchInMatchProvider getProviderOverride(
    covariant GetAllPlayersInMatchInMatchProvider provider,
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
  String? get name => r'getAllPlayersInMatchInMatchProvider';
}

/// See also [getAllPlayersInMatchInMatch].
class GetAllPlayersInMatchInMatchProvider
    extends AutoDisposeFutureProvider<List<PlayerInMatch>> {
  /// See also [getAllPlayersInMatchInMatch].
  GetAllPlayersInMatchInMatchProvider(
    int match_id,
  ) : this._internal(
          (ref) => getAllPlayersInMatchInMatch(
            ref as GetAllPlayersInMatchInMatchRef,
            match_id,
          ),
          from: getAllPlayersInMatchInMatchProvider,
          name: r'getAllPlayersInMatchInMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllPlayersInMatchInMatchHash,
          dependencies: GetAllPlayersInMatchInMatchFamily._dependencies,
          allTransitiveDependencies:
              GetAllPlayersInMatchInMatchFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  GetAllPlayersInMatchInMatchProvider._internal(
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
    FutureOr<List<PlayerInMatch>> Function(
            GetAllPlayersInMatchInMatchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllPlayersInMatchInMatchProvider._internal(
        (ref) => create(ref as GetAllPlayersInMatchInMatchRef),
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
  AutoDisposeFutureProviderElement<List<PlayerInMatch>> createElement() {
    return _GetAllPlayersInMatchInMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllPlayersInMatchInMatchProvider &&
        other.match_id == match_id;
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
mixin GetAllPlayersInMatchInMatchRef
    on AutoDisposeFutureProviderRef<List<PlayerInMatch>> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _GetAllPlayersInMatchInMatchProviderElement
    extends AutoDisposeFutureProviderElement<List<PlayerInMatch>>
    with GetAllPlayersInMatchInMatchRef {
  _GetAllPlayersInMatchInMatchProviderElement(super.provider);

  @override
  int get match_id => (origin as GetAllPlayersInMatchInMatchProvider).match_id;
}

String _$getAllSubPlayersInMatchHash() =>
    r'c6d616aadd4bc6dff98088fe909bb0ef6a18224b';

/// See also [getAllSubPlayersInMatch].
@ProviderFor(getAllSubPlayersInMatch)
const getAllSubPlayersInMatchProvider = GetAllSubPlayersInMatchFamily();

/// See also [getAllSubPlayersInMatch].
class GetAllSubPlayersInMatchFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [getAllSubPlayersInMatch].
  const GetAllSubPlayersInMatchFamily();

  /// See also [getAllSubPlayersInMatch].
  GetAllSubPlayersInMatchProvider call(
    int match_id,
  ) {
    return GetAllSubPlayersInMatchProvider(
      match_id,
    );
  }

  @override
  GetAllSubPlayersInMatchProvider getProviderOverride(
    covariant GetAllSubPlayersInMatchProvider provider,
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
  String? get name => r'getAllSubPlayersInMatchProvider';
}

/// See also [getAllSubPlayersInMatch].
class GetAllSubPlayersInMatchProvider
    extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [getAllSubPlayersInMatch].
  GetAllSubPlayersInMatchProvider(
    int match_id,
  ) : this._internal(
          (ref) => getAllSubPlayersInMatch(
            ref as GetAllSubPlayersInMatchRef,
            match_id,
          ),
          from: getAllSubPlayersInMatchProvider,
          name: r'getAllSubPlayersInMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllSubPlayersInMatchHash,
          dependencies: GetAllSubPlayersInMatchFamily._dependencies,
          allTransitiveDependencies:
              GetAllSubPlayersInMatchFamily._allTransitiveDependencies,
          match_id: match_id,
        );

  GetAllSubPlayersInMatchProvider._internal(
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
    FutureOr<List<Player>> Function(GetAllSubPlayersInMatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllSubPlayersInMatchProvider._internal(
        (ref) => create(ref as GetAllSubPlayersInMatchRef),
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
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _GetAllSubPlayersInMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllSubPlayersInMatchProvider &&
        other.match_id == match_id;
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
mixin GetAllSubPlayersInMatchRef on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `match_id` of this provider.
  int get match_id;
}

class _GetAllSubPlayersInMatchProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with GetAllSubPlayersInMatchRef {
  _GetAllSubPlayersInMatchProviderElement(super.provider);

  @override
  int get match_id => (origin as GetAllSubPlayersInMatchProvider).match_id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
