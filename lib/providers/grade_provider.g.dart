// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$insertGradeInBulkHash() => r'3c9fe34efef570d33be0fed4e412fffa84e38546';

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

/// See also [insertGradeInBulk].
@ProviderFor(insertGradeInBulk)
const insertGradeInBulkProvider = InsertGradeInBulkFamily();

/// See also [insertGradeInBulk].
class InsertGradeInBulkFamily extends Family<AsyncValue<void>> {
  /// See also [insertGradeInBulk].
  const InsertGradeInBulkFamily();

  /// See also [insertGradeInBulk].
  InsertGradeInBulkProvider call(
    List<PlayerGrade> grades,
  ) {
    return InsertGradeInBulkProvider(
      grades,
    );
  }

  @override
  InsertGradeInBulkProvider getProviderOverride(
    covariant InsertGradeInBulkProvider provider,
  ) {
    return call(
      provider.grades,
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
  String? get name => r'insertGradeInBulkProvider';
}

/// See also [insertGradeInBulk].
class InsertGradeInBulkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertGradeInBulk].
  InsertGradeInBulkProvider(
    List<PlayerGrade> grades,
  ) : this._internal(
          (ref) => insertGradeInBulk(
            ref as InsertGradeInBulkRef,
            grades,
          ),
          from: insertGradeInBulkProvider,
          name: r'insertGradeInBulkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertGradeInBulkHash,
          dependencies: InsertGradeInBulkFamily._dependencies,
          allTransitiveDependencies:
              InsertGradeInBulkFamily._allTransitiveDependencies,
          grades: grades,
        );

  InsertGradeInBulkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.grades,
  }) : super.internal();

  final List<PlayerGrade> grades;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertGradeInBulkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertGradeInBulkProvider._internal(
        (ref) => create(ref as InsertGradeInBulkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        grades: grades,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertGradeInBulkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertGradeInBulkProvider && other.grades == grades;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, grades.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InsertGradeInBulkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `grades` of this provider.
  List<PlayerGrade> get grades;
}

class _InsertGradeInBulkProviderElement
    extends AutoDisposeFutureProviderElement<void> with InsertGradeInBulkRef {
  _InsertGradeInBulkProviderElement(super.provider);

  @override
  List<PlayerGrade> get grades => (origin as InsertGradeInBulkProvider).grades;
}

String _$getPlayerGradesByPlayerIdHash() =>
    r'7e66464e8dbc4fb05a45a7d27aea3ee4e824f99a';

/// See also [getPlayerGradesByPlayerId].
@ProviderFor(getPlayerGradesByPlayerId)
const getPlayerGradesByPlayerIdProvider = GetPlayerGradesByPlayerIdFamily();

/// See also [getPlayerGradesByPlayerId].
class GetPlayerGradesByPlayerIdFamily
    extends Family<AsyncValue<List<PlayerGrade>>> {
  /// See also [getPlayerGradesByPlayerId].
  const GetPlayerGradesByPlayerIdFamily();

  /// See also [getPlayerGradesByPlayerId].
  GetPlayerGradesByPlayerIdProvider call(
    int id,
  ) {
    return GetPlayerGradesByPlayerIdProvider(
      id,
    );
  }

  @override
  GetPlayerGradesByPlayerIdProvider getProviderOverride(
    covariant GetPlayerGradesByPlayerIdProvider provider,
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
  String? get name => r'getPlayerGradesByPlayerIdProvider';
}

/// See also [getPlayerGradesByPlayerId].
class GetPlayerGradesByPlayerIdProvider
    extends AutoDisposeFutureProvider<List<PlayerGrade>> {
  /// See also [getPlayerGradesByPlayerId].
  GetPlayerGradesByPlayerIdProvider(
    int id,
  ) : this._internal(
          (ref) => getPlayerGradesByPlayerId(
            ref as GetPlayerGradesByPlayerIdRef,
            id,
          ),
          from: getPlayerGradesByPlayerIdProvider,
          name: r'getPlayerGradesByPlayerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlayerGradesByPlayerIdHash,
          dependencies: GetPlayerGradesByPlayerIdFamily._dependencies,
          allTransitiveDependencies:
              GetPlayerGradesByPlayerIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetPlayerGradesByPlayerIdProvider._internal(
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
    FutureOr<List<PlayerGrade>> Function(GetPlayerGradesByPlayerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlayerGradesByPlayerIdProvider._internal(
        (ref) => create(ref as GetPlayerGradesByPlayerIdRef),
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
  AutoDisposeFutureProviderElement<List<PlayerGrade>> createElement() {
    return _GetPlayerGradesByPlayerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlayerGradesByPlayerIdProvider && other.id == id;
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
mixin GetPlayerGradesByPlayerIdRef
    on AutoDisposeFutureProviderRef<List<PlayerGrade>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetPlayerGradesByPlayerIdProviderElement
    extends AutoDisposeFutureProviderElement<List<PlayerGrade>>
    with GetPlayerGradesByPlayerIdRef {
  _GetPlayerGradesByPlayerIdProviderElement(super.provider);

  @override
  int get id => (origin as GetPlayerGradesByPlayerIdProvider).id;
}

String _$getGradeMatchDateHash() => r'5015526c309628e7c1454d21a0ff15891f572f88';

/// See also [getGradeMatchDate].
@ProviderFor(getGradeMatchDate)
const getGradeMatchDateProvider = GetGradeMatchDateFamily();

/// See also [getGradeMatchDate].
class GetGradeMatchDateFamily extends Family<AsyncValue<DateTime>> {
  /// See also [getGradeMatchDate].
  const GetGradeMatchDateFamily();

  /// See also [getGradeMatchDate].
  GetGradeMatchDateProvider call(
    PlayerGrade grade,
  ) {
    return GetGradeMatchDateProvider(
      grade,
    );
  }

  @override
  GetGradeMatchDateProvider getProviderOverride(
    covariant GetGradeMatchDateProvider provider,
  ) {
    return call(
      provider.grade,
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
  String? get name => r'getGradeMatchDateProvider';
}

/// See also [getGradeMatchDate].
class GetGradeMatchDateProvider extends AutoDisposeFutureProvider<DateTime> {
  /// See also [getGradeMatchDate].
  GetGradeMatchDateProvider(
    PlayerGrade grade,
  ) : this._internal(
          (ref) => getGradeMatchDate(
            ref as GetGradeMatchDateRef,
            grade,
          ),
          from: getGradeMatchDateProvider,
          name: r'getGradeMatchDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGradeMatchDateHash,
          dependencies: GetGradeMatchDateFamily._dependencies,
          allTransitiveDependencies:
              GetGradeMatchDateFamily._allTransitiveDependencies,
          grade: grade,
        );

  GetGradeMatchDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.grade,
  }) : super.internal();

  final PlayerGrade grade;

  @override
  Override overrideWith(
    FutureOr<DateTime> Function(GetGradeMatchDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGradeMatchDateProvider._internal(
        (ref) => create(ref as GetGradeMatchDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        grade: grade,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DateTime> createElement() {
    return _GetGradeMatchDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGradeMatchDateProvider && other.grade == grade;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, grade.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetGradeMatchDateRef on AutoDisposeFutureProviderRef<DateTime> {
  /// The parameter `grade` of this provider.
  PlayerGrade get grade;
}

class _GetGradeMatchDateProviderElement
    extends AutoDisposeFutureProviderElement<DateTime>
    with GetGradeMatchDateRef {
  _GetGradeMatchDateProviderElement(super.provider);

  @override
  PlayerGrade get grade => (origin as GetGradeMatchDateProvider).grade;
}

String _$getGradeCategoryNameHash() =>
    r'ae91b3738fdf1418751e69204edbe4862052d051';

/// See also [getGradeCategoryName].
@ProviderFor(getGradeCategoryName)
const getGradeCategoryNameProvider = GetGradeCategoryNameFamily();

/// See also [getGradeCategoryName].
class GetGradeCategoryNameFamily extends Family<AsyncValue<String>> {
  /// See also [getGradeCategoryName].
  const GetGradeCategoryNameFamily();

  /// See also [getGradeCategoryName].
  GetGradeCategoryNameProvider call(
    PlayerGrade grade,
  ) {
    return GetGradeCategoryNameProvider(
      grade,
    );
  }

  @override
  GetGradeCategoryNameProvider getProviderOverride(
    covariant GetGradeCategoryNameProvider provider,
  ) {
    return call(
      provider.grade,
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
  String? get name => r'getGradeCategoryNameProvider';
}

/// See also [getGradeCategoryName].
class GetGradeCategoryNameProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getGradeCategoryName].
  GetGradeCategoryNameProvider(
    PlayerGrade grade,
  ) : this._internal(
          (ref) => getGradeCategoryName(
            ref as GetGradeCategoryNameRef,
            grade,
          ),
          from: getGradeCategoryNameProvider,
          name: r'getGradeCategoryNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGradeCategoryNameHash,
          dependencies: GetGradeCategoryNameFamily._dependencies,
          allTransitiveDependencies:
              GetGradeCategoryNameFamily._allTransitiveDependencies,
          grade: grade,
        );

  GetGradeCategoryNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.grade,
  }) : super.internal();

  final PlayerGrade grade;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetGradeCategoryNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGradeCategoryNameProvider._internal(
        (ref) => create(ref as GetGradeCategoryNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        grade: grade,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetGradeCategoryNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGradeCategoryNameProvider && other.grade == grade;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, grade.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetGradeCategoryNameRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `grade` of this provider.
  PlayerGrade get grade;
}

class _GetGradeCategoryNameProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with GetGradeCategoryNameRef {
  _GetGradeCategoryNameProviderElement(super.provider);

  @override
  PlayerGrade get grade => (origin as GetGradeCategoryNameProvider).grade;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
