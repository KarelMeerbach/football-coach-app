// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getGradeCategoryByCreatorHash() =>
    r'2fd8e9eaedec61f20b880de58c4a7ed08241c112';

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

/// See also [getGradeCategoryByCreator].
@ProviderFor(getGradeCategoryByCreator)
const getGradeCategoryByCreatorProvider = GetGradeCategoryByCreatorFamily();

/// See also [getGradeCategoryByCreator].
class GetGradeCategoryByCreatorFamily
    extends Family<AsyncValue<List<GradeCategory>>> {
  /// See also [getGradeCategoryByCreator].
  const GetGradeCategoryByCreatorFamily();

  /// See also [getGradeCategoryByCreator].
  GetGradeCategoryByCreatorProvider call(
    String id,
  ) {
    return GetGradeCategoryByCreatorProvider(
      id,
    );
  }

  @override
  GetGradeCategoryByCreatorProvider getProviderOverride(
    covariant GetGradeCategoryByCreatorProvider provider,
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
  String? get name => r'getGradeCategoryByCreatorProvider';
}

/// See also [getGradeCategoryByCreator].
class GetGradeCategoryByCreatorProvider
    extends AutoDisposeFutureProvider<List<GradeCategory>> {
  /// See also [getGradeCategoryByCreator].
  GetGradeCategoryByCreatorProvider(
    String id,
  ) : this._internal(
          (ref) => getGradeCategoryByCreator(
            ref as GetGradeCategoryByCreatorRef,
            id,
          ),
          from: getGradeCategoryByCreatorProvider,
          name: r'getGradeCategoryByCreatorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGradeCategoryByCreatorHash,
          dependencies: GetGradeCategoryByCreatorFamily._dependencies,
          allTransitiveDependencies:
              GetGradeCategoryByCreatorFamily._allTransitiveDependencies,
          id: id,
        );

  GetGradeCategoryByCreatorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<GradeCategory>> Function(
            GetGradeCategoryByCreatorRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGradeCategoryByCreatorProvider._internal(
        (ref) => create(ref as GetGradeCategoryByCreatorRef),
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
  AutoDisposeFutureProviderElement<List<GradeCategory>> createElement() {
    return _GetGradeCategoryByCreatorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGradeCategoryByCreatorProvider && other.id == id;
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
mixin GetGradeCategoryByCreatorRef
    on AutoDisposeFutureProviderRef<List<GradeCategory>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetGradeCategoryByCreatorProviderElement
    extends AutoDisposeFutureProviderElement<List<GradeCategory>>
    with GetGradeCategoryByCreatorRef {
  _GetGradeCategoryByCreatorProviderElement(super.provider);

  @override
  String get id => (origin as GetGradeCategoryByCreatorProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
