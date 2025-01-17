// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamListHash() => r'94dea5288ae40b05638abd1da23f9961dfc438a4';

/// See also [teamList].
@ProviderFor(teamList)
final teamListProvider = AutoDisposeFutureProvider<List<Team>>.internal(
  teamList,
  name: r'teamListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$teamListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TeamListRef = AutoDisposeFutureProviderRef<List<Team>>;
String _$createTeamHash() => r'68718848edda9db7f6fe850f718d7fb33752256a';

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

/// See also [createTeam].
@ProviderFor(createTeam)
const createTeamProvider = CreateTeamFamily();

/// See also [createTeam].
class CreateTeamFamily extends Family<AsyncValue<void>> {
  /// See also [createTeam].
  const CreateTeamFamily();

  /// See also [createTeam].
  CreateTeamProvider call(
    String inputname,
    String inputdescription,
  ) {
    return CreateTeamProvider(
      inputname,
      inputdescription,
    );
  }

  @override
  CreateTeamProvider getProviderOverride(
    covariant CreateTeamProvider provider,
  ) {
    return call(
      provider.inputname,
      provider.inputdescription,
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
  String? get name => r'createTeamProvider';
}

/// See also [createTeam].
class CreateTeamProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createTeam].
  CreateTeamProvider(
    String inputname,
    String inputdescription,
  ) : this._internal(
          (ref) => createTeam(
            ref as CreateTeamRef,
            inputname,
            inputdescription,
          ),
          from: createTeamProvider,
          name: r'createTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTeamHash,
          dependencies: CreateTeamFamily._dependencies,
          allTransitiveDependencies:
              CreateTeamFamily._allTransitiveDependencies,
          inputname: inputname,
          inputdescription: inputdescription,
        );

  CreateTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inputname,
    required this.inputdescription,
  }) : super.internal();

  final String inputname;
  final String inputdescription;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateTeamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTeamProvider._internal(
        (ref) => create(ref as CreateTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inputname: inputname,
        inputdescription: inputdescription,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTeamProvider &&
        other.inputname == inputname &&
        other.inputdescription == inputdescription;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inputname.hashCode);
    hash = _SystemHash.combine(hash, inputdescription.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateTeamRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `inputname` of this provider.
  String get inputname;

  /// The parameter `inputdescription` of this provider.
  String get inputdescription;
}

class _CreateTeamProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateTeamRef {
  _CreateTeamProviderElement(super.provider);

  @override
  String get inputname => (origin as CreateTeamProvider).inputname;
  @override
  String get inputdescription =>
      (origin as CreateTeamProvider).inputdescription;
}

String _$getTeamByIdHash() => r'5daa002ce39538ae28851d16cc0201466ecedd02';

/// See also [getTeamById].
@ProviderFor(getTeamById)
const getTeamByIdProvider = GetTeamByIdFamily();

/// See also [getTeamById].
class GetTeamByIdFamily extends Family<AsyncValue<Team>> {
  /// See also [getTeamById].
  const GetTeamByIdFamily();

  /// See also [getTeamById].
  GetTeamByIdProvider call(
    int teamId,
  ) {
    return GetTeamByIdProvider(
      teamId,
    );
  }

  @override
  GetTeamByIdProvider getProviderOverride(
    covariant GetTeamByIdProvider provider,
  ) {
    return call(
      provider.teamId,
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
  String? get name => r'getTeamByIdProvider';
}

/// See also [getTeamById].
class GetTeamByIdProvider extends AutoDisposeFutureProvider<Team> {
  /// See also [getTeamById].
  GetTeamByIdProvider(
    int teamId,
  ) : this._internal(
          (ref) => getTeamById(
            ref as GetTeamByIdRef,
            teamId,
          ),
          from: getTeamByIdProvider,
          name: r'getTeamByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTeamByIdHash,
          dependencies: GetTeamByIdFamily._dependencies,
          allTransitiveDependencies:
              GetTeamByIdFamily._allTransitiveDependencies,
          teamId: teamId,
        );

  GetTeamByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamId,
  }) : super.internal();

  final int teamId;

  @override
  Override overrideWith(
    FutureOr<Team> Function(GetTeamByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTeamByIdProvider._internal(
        (ref) => create(ref as GetTeamByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamId: teamId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Team> createElement() {
    return _GetTeamByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTeamByIdProvider && other.teamId == teamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTeamByIdRef on AutoDisposeFutureProviderRef<Team> {
  /// The parameter `teamId` of this provider.
  int get teamId;
}

class _GetTeamByIdProviderElement extends AutoDisposeFutureProviderElement<Team>
    with GetTeamByIdRef {
  _GetTeamByIdProviderElement(super.provider);

  @override
  int get teamId => (origin as GetTeamByIdProvider).teamId;
}

String _$updateTeamByIdHash() => r'f162325e9e82a810e0b99fd736fb01fdbc716b66';

/// See also [updateTeamById].
@ProviderFor(updateTeamById)
const updateTeamByIdProvider = UpdateTeamByIdFamily();

/// See also [updateTeamById].
class UpdateTeamByIdFamily extends Family<AsyncValue<void>> {
  /// See also [updateTeamById].
  const UpdateTeamByIdFamily();

  /// See also [updateTeamById].
  UpdateTeamByIdProvider call(
    int teamId,
    String teamname,
    String teamdesc,
  ) {
    return UpdateTeamByIdProvider(
      teamId,
      teamname,
      teamdesc,
    );
  }

  @override
  UpdateTeamByIdProvider getProviderOverride(
    covariant UpdateTeamByIdProvider provider,
  ) {
    return call(
      provider.teamId,
      provider.teamname,
      provider.teamdesc,
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
  String? get name => r'updateTeamByIdProvider';
}

/// See also [updateTeamById].
class UpdateTeamByIdProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateTeamById].
  UpdateTeamByIdProvider(
    int teamId,
    String teamname,
    String teamdesc,
  ) : this._internal(
          (ref) => updateTeamById(
            ref as UpdateTeamByIdRef,
            teamId,
            teamname,
            teamdesc,
          ),
          from: updateTeamByIdProvider,
          name: r'updateTeamByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateTeamByIdHash,
          dependencies: UpdateTeamByIdFamily._dependencies,
          allTransitiveDependencies:
              UpdateTeamByIdFamily._allTransitiveDependencies,
          teamId: teamId,
          teamname: teamname,
          teamdesc: teamdesc,
        );

  UpdateTeamByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamId,
    required this.teamname,
    required this.teamdesc,
  }) : super.internal();

  final int teamId;
  final String teamname;
  final String teamdesc;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateTeamByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateTeamByIdProvider._internal(
        (ref) => create(ref as UpdateTeamByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamId: teamId,
        teamname: teamname,
        teamdesc: teamdesc,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateTeamByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateTeamByIdProvider &&
        other.teamId == teamId &&
        other.teamname == teamname &&
        other.teamdesc == teamdesc;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamId.hashCode);
    hash = _SystemHash.combine(hash, teamname.hashCode);
    hash = _SystemHash.combine(hash, teamdesc.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateTeamByIdRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `teamId` of this provider.
  int get teamId;

  /// The parameter `teamname` of this provider.
  String get teamname;

  /// The parameter `teamdesc` of this provider.
  String get teamdesc;
}

class _UpdateTeamByIdProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateTeamByIdRef {
  _UpdateTeamByIdProviderElement(super.provider);

  @override
  int get teamId => (origin as UpdateTeamByIdProvider).teamId;
  @override
  String get teamname => (origin as UpdateTeamByIdProvider).teamname;
  @override
  String get teamdesc => (origin as UpdateTeamByIdProvider).teamdesc;
}

String _$deleteTeamByIdHash() => r'a48931b09e84bc7aefaedb3421626f89eafb1af8';

/// See also [deleteTeamById].
@ProviderFor(deleteTeamById)
const deleteTeamByIdProvider = DeleteTeamByIdFamily();

/// See also [deleteTeamById].
class DeleteTeamByIdFamily extends Family<AsyncValue<void>> {
  /// See also [deleteTeamById].
  const DeleteTeamByIdFamily();

  /// See also [deleteTeamById].
  DeleteTeamByIdProvider call(
    int teamId,
  ) {
    return DeleteTeamByIdProvider(
      teamId,
    );
  }

  @override
  DeleteTeamByIdProvider getProviderOverride(
    covariant DeleteTeamByIdProvider provider,
  ) {
    return call(
      provider.teamId,
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
  String? get name => r'deleteTeamByIdProvider';
}

/// See also [deleteTeamById].
class DeleteTeamByIdProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteTeamById].
  DeleteTeamByIdProvider(
    int teamId,
  ) : this._internal(
          (ref) => deleteTeamById(
            ref as DeleteTeamByIdRef,
            teamId,
          ),
          from: deleteTeamByIdProvider,
          name: r'deleteTeamByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTeamByIdHash,
          dependencies: DeleteTeamByIdFamily._dependencies,
          allTransitiveDependencies:
              DeleteTeamByIdFamily._allTransitiveDependencies,
          teamId: teamId,
        );

  DeleteTeamByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamId,
  }) : super.internal();

  final int teamId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteTeamByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTeamByIdProvider._internal(
        (ref) => create(ref as DeleteTeamByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamId: teamId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteTeamByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTeamByIdProvider && other.teamId == teamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteTeamByIdRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `teamId` of this provider.
  int get teamId;
}

class _DeleteTeamByIdProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteTeamByIdRef {
  _DeleteTeamByIdProviderElement(super.provider);

  @override
  int get teamId => (origin as DeleteTeamByIdProvider).teamId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
