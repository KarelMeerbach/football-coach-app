// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerListByTeamIdHash() =>
    r'50f2507e7a120c22332bf5122a23cde47d4daad7';

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

/// See also [playerListByTeamId].
@ProviderFor(playerListByTeamId)
const playerListByTeamIdProvider = PlayerListByTeamIdFamily();

/// See also [playerListByTeamId].
class PlayerListByTeamIdFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [playerListByTeamId].
  const PlayerListByTeamIdFamily();

  /// See also [playerListByTeamId].
  PlayerListByTeamIdProvider call(
    int team_id,
  ) {
    return PlayerListByTeamIdProvider(
      team_id,
    );
  }

  @override
  PlayerListByTeamIdProvider getProviderOverride(
    covariant PlayerListByTeamIdProvider provider,
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
  String? get name => r'playerListByTeamIdProvider';
}

/// See also [playerListByTeamId].
class PlayerListByTeamIdProvider
    extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [playerListByTeamId].
  PlayerListByTeamIdProvider(
    int team_id,
  ) : this._internal(
          (ref) => playerListByTeamId(
            ref as PlayerListByTeamIdRef,
            team_id,
          ),
          from: playerListByTeamIdProvider,
          name: r'playerListByTeamIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerListByTeamIdHash,
          dependencies: PlayerListByTeamIdFamily._dependencies,
          allTransitiveDependencies:
              PlayerListByTeamIdFamily._allTransitiveDependencies,
          team_id: team_id,
        );

  PlayerListByTeamIdProvider._internal(
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
    FutureOr<List<Player>> Function(PlayerListByTeamIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerListByTeamIdProvider._internal(
        (ref) => create(ref as PlayerListByTeamIdRef),
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
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _PlayerListByTeamIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerListByTeamIdProvider && other.team_id == team_id;
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
mixin PlayerListByTeamIdRef on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `team_id` of this provider.
  int get team_id;
}

class _PlayerListByTeamIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with PlayerListByTeamIdRef {
  _PlayerListByTeamIdProviderElement(super.provider);

  @override
  int get team_id => (origin as PlayerListByTeamIdProvider).team_id;
}

String _$addPlayerToTeamHash() => r'074ede74b57ceb693432223f05a59afc7f261717';

/// See also [addPlayerToTeam].
@ProviderFor(addPlayerToTeam)
const addPlayerToTeamProvider = AddPlayerToTeamFamily();

/// See also [addPlayerToTeam].
class AddPlayerToTeamFamily extends Family<AsyncValue<void>> {
  /// See also [addPlayerToTeam].
  const AddPlayerToTeamFamily();

  /// See also [addPlayerToTeam].
  AddPlayerToTeamProvider call(
    Player player,
  ) {
    return AddPlayerToTeamProvider(
      player,
    );
  }

  @override
  AddPlayerToTeamProvider getProviderOverride(
    covariant AddPlayerToTeamProvider provider,
  ) {
    return call(
      provider.player,
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
  String? get name => r'addPlayerToTeamProvider';
}

/// See also [addPlayerToTeam].
class AddPlayerToTeamProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addPlayerToTeam].
  AddPlayerToTeamProvider(
    Player player,
  ) : this._internal(
          (ref) => addPlayerToTeam(
            ref as AddPlayerToTeamRef,
            player,
          ),
          from: addPlayerToTeamProvider,
          name: r'addPlayerToTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addPlayerToTeamHash,
          dependencies: AddPlayerToTeamFamily._dependencies,
          allTransitiveDependencies:
              AddPlayerToTeamFamily._allTransitiveDependencies,
          player: player,
        );

  AddPlayerToTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.player,
  }) : super.internal();

  final Player player;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddPlayerToTeamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddPlayerToTeamProvider._internal(
        (ref) => create(ref as AddPlayerToTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        player: player,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddPlayerToTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPlayerToTeamProvider && other.player == player;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, player.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddPlayerToTeamRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `player` of this provider.
  Player get player;
}

class _AddPlayerToTeamProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddPlayerToTeamRef {
  _AddPlayerToTeamProviderElement(super.provider);

  @override
  Player get player => (origin as AddPlayerToTeamProvider).player;
}

String _$getPlayerByidHash() => r'd205ca6b71b1c6089b50517e51073e540c5cc7e1';

/// See also [getPlayerByid].
@ProviderFor(getPlayerByid)
const getPlayerByidProvider = GetPlayerByidFamily();

/// See also [getPlayerByid].
class GetPlayerByidFamily extends Family<AsyncValue<Player>> {
  /// See also [getPlayerByid].
  const GetPlayerByidFamily();

  /// See also [getPlayerByid].
  GetPlayerByidProvider call(
    int id,
  ) {
    return GetPlayerByidProvider(
      id,
    );
  }

  @override
  GetPlayerByidProvider getProviderOverride(
    covariant GetPlayerByidProvider provider,
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
  String? get name => r'getPlayerByidProvider';
}

/// See also [getPlayerByid].
class GetPlayerByidProvider extends AutoDisposeFutureProvider<Player> {
  /// See also [getPlayerByid].
  GetPlayerByidProvider(
    int id,
  ) : this._internal(
          (ref) => getPlayerByid(
            ref as GetPlayerByidRef,
            id,
          ),
          from: getPlayerByidProvider,
          name: r'getPlayerByidProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlayerByidHash,
          dependencies: GetPlayerByidFamily._dependencies,
          allTransitiveDependencies:
              GetPlayerByidFamily._allTransitiveDependencies,
          id: id,
        );

  GetPlayerByidProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Player> Function(GetPlayerByidRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlayerByidProvider._internal(
        (ref) => create(ref as GetPlayerByidRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Player> createElement() {
    return _GetPlayerByidProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlayerByidProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPlayerByidRef on AutoDisposeFutureProviderRef<Player> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetPlayerByidProviderElement
    extends AutoDisposeFutureProviderElement<Player> with GetPlayerByidRef {
  _GetPlayerByidProviderElement(super.provider);

  @override
  int get id => (origin as GetPlayerByidProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
