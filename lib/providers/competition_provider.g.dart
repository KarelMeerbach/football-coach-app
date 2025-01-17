// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCompetitionListByTeamIdHash() =>
    r'c066d91cfc1c4564c2de2c3bd813ef4d76f4e566';

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

/// See also [getCompetitionListByTeamId].
@ProviderFor(getCompetitionListByTeamId)
const getCompetitionListByTeamIdProvider = GetCompetitionListByTeamIdFamily();

/// See also [getCompetitionListByTeamId].
class GetCompetitionListByTeamIdFamily
    extends Family<AsyncValue<List<Competition>>> {
  /// See also [getCompetitionListByTeamId].
  const GetCompetitionListByTeamIdFamily();

  /// See also [getCompetitionListByTeamId].
  GetCompetitionListByTeamIdProvider call(
    int team_id,
  ) {
    return GetCompetitionListByTeamIdProvider(
      team_id,
    );
  }

  @override
  GetCompetitionListByTeamIdProvider getProviderOverride(
    covariant GetCompetitionListByTeamIdProvider provider,
  ) {
    return call(
      provider.team_id,
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
  String? get name => r'getCompetitionListByTeamIdProvider';
}

/// See also [getCompetitionListByTeamId].
class GetCompetitionListByTeamIdProvider
    extends AutoDisposeFutureProvider<List<Competition>> {
  /// See also [getCompetitionListByTeamId].
  GetCompetitionListByTeamIdProvider(
    int team_id,
  ) : this._internal(
          (ref) => getCompetitionListByTeamId(
            ref as GetCompetitionListByTeamIdRef,
            team_id,
          ),
          from: getCompetitionListByTeamIdProvider,
          name: r'getCompetitionListByTeamIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCompetitionListByTeamIdHash,
          dependencies: GetCompetitionListByTeamIdFamily._dependencies,
          allTransitiveDependencies:
              GetCompetitionListByTeamIdFamily._allTransitiveDependencies,
          team_id: team_id,
        );

  GetCompetitionListByTeamIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.team_id,
  }) : super.internal();

  final int team_id;

  @override
  Override overrideWith(
    FutureOr<List<Competition>> Function(GetCompetitionListByTeamIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCompetitionListByTeamIdProvider._internal(
        (ref) => create(ref as GetCompetitionListByTeamIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        team_id: team_id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Competition>> createElement() {
    return _GetCompetitionListByTeamIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCompetitionListByTeamIdProvider &&
        other.team_id == team_id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, team_id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCompetitionListByTeamIdRef
    on AutoDisposeFutureProviderRef<List<Competition>> {
  /// The parameter `team_id` of this provider.
  int get team_id;
}

class _GetCompetitionListByTeamIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Competition>>
    with GetCompetitionListByTeamIdRef {
  _GetCompetitionListByTeamIdProviderElement(super.provider);

  @override
  int get team_id => (origin as GetCompetitionListByTeamIdProvider).team_id;
}

String _$getCompetitionByIdHash() =>
    r'4e83e3a8220debe63d99c7ea09c4decaafd9e443';

/// See also [getCompetitionById].
@ProviderFor(getCompetitionById)
const getCompetitionByIdProvider = GetCompetitionByIdFamily();

/// See also [getCompetitionById].
class GetCompetitionByIdFamily extends Family<AsyncValue<Competition>> {
  /// See also [getCompetitionById].
  const GetCompetitionByIdFamily();

  /// See also [getCompetitionById].
  GetCompetitionByIdProvider call(
    int comp_id,
  ) {
    return GetCompetitionByIdProvider(
      comp_id,
    );
  }

  @override
  GetCompetitionByIdProvider getProviderOverride(
    covariant GetCompetitionByIdProvider provider,
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
  String? get name => r'getCompetitionByIdProvider';
}

/// See also [getCompetitionById].
class GetCompetitionByIdProvider
    extends AutoDisposeFutureProvider<Competition> {
  /// See also [getCompetitionById].
  GetCompetitionByIdProvider(
    int comp_id,
  ) : this._internal(
          (ref) => getCompetitionById(
            ref as GetCompetitionByIdRef,
            comp_id,
          ),
          from: getCompetitionByIdProvider,
          name: r'getCompetitionByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCompetitionByIdHash,
          dependencies: GetCompetitionByIdFamily._dependencies,
          allTransitiveDependencies:
              GetCompetitionByIdFamily._allTransitiveDependencies,
          comp_id: comp_id,
        );

  GetCompetitionByIdProvider._internal(
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
    FutureOr<Competition> Function(GetCompetitionByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCompetitionByIdProvider._internal(
        (ref) => create(ref as GetCompetitionByIdRef),
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
  AutoDisposeFutureProviderElement<Competition> createElement() {
    return _GetCompetitionByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCompetitionByIdProvider && other.comp_id == comp_id;
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
mixin GetCompetitionByIdRef on AutoDisposeFutureProviderRef<Competition> {
  /// The parameter `comp_id` of this provider.
  int get comp_id;
}

class _GetCompetitionByIdProviderElement
    extends AutoDisposeFutureProviderElement<Competition>
    with GetCompetitionByIdRef {
  _GetCompetitionByIdProviderElement(super.provider);

  @override
  int get comp_id => (origin as GetCompetitionByIdProvider).comp_id;
}

String _$insertCompetitionHash() => r'908625f5fcc625c8f0f1fa0b3bee6f8fe2c746f6';

/// See also [insertCompetition].
@ProviderFor(insertCompetition)
const insertCompetitionProvider = InsertCompetitionFamily();

/// See also [insertCompetition].
class InsertCompetitionFamily extends Family<AsyncValue<void>> {
  /// See also [insertCompetition].
  const InsertCompetitionFamily();

  /// See also [insertCompetition].
  InsertCompetitionProvider call(
    Competition competition,
  ) {
    return InsertCompetitionProvider(
      competition,
    );
  }

  @override
  InsertCompetitionProvider getProviderOverride(
    covariant InsertCompetitionProvider provider,
  ) {
    return call(
      provider.competition,
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
  String? get name => r'insertCompetitionProvider';
}

/// See also [insertCompetition].
class InsertCompetitionProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertCompetition].
  InsertCompetitionProvider(
    Competition competition,
  ) : this._internal(
          (ref) => insertCompetition(
            ref as InsertCompetitionRef,
            competition,
          ),
          from: insertCompetitionProvider,
          name: r'insertCompetitionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertCompetitionHash,
          dependencies: InsertCompetitionFamily._dependencies,
          allTransitiveDependencies:
              InsertCompetitionFamily._allTransitiveDependencies,
          competition: competition,
        );

  InsertCompetitionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.competition,
  }) : super.internal();

  final Competition competition;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertCompetitionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertCompetitionProvider._internal(
        (ref) => create(ref as InsertCompetitionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        competition: competition,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertCompetitionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertCompetitionProvider &&
        other.competition == competition;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, competition.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InsertCompetitionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `competition` of this provider.
  Competition get competition;
}

class _InsertCompetitionProviderElement
    extends AutoDisposeFutureProviderElement<void> with InsertCompetitionRef {
  _InsertCompetitionProviderElement(super.provider);

  @override
  Competition get competition =>
      (origin as InsertCompetitionProvider).competition;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
