// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailControllerHash() =>
    r'3578db28ed9f12d388cc184ffdb56572ba86ebe0';

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

typedef CourseDetailControllerRef = AutoDisposeFutureProviderRef<CourseItem?>;

/// See also [courseDetailController].
@ProviderFor(courseDetailController)
const courseDetailControllerProvider = CourseDetailControllerFamily();

/// See also [courseDetailController].
class CourseDetailControllerFamily extends Family<AsyncValue<CourseItem?>> {
  /// See also [courseDetailController].
  const CourseDetailControllerFamily();

  /// See also [courseDetailController].
  CourseDetailControllerProvider call({
    required int index,
  }) {
    return CourseDetailControllerProvider(
      index: index,
    );
  }

  @override
  CourseDetailControllerProvider getProviderOverride(
    covariant CourseDetailControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'courseDetailControllerProvider';
}

/// See also [courseDetailController].
class CourseDetailControllerProvider
    extends AutoDisposeFutureProvider<CourseItem?> {
  /// See also [courseDetailController].
  CourseDetailControllerProvider({
    required this.index,
  }) : super.internal(
          (ref) => courseDetailController(
            ref,
            index: index,
          ),
          from: courseDetailControllerProvider,
          name: r'courseDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailControllerHash,
          dependencies: CourseDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailControllerFamily._allTransitiveDependencies,
        );

  final int index;

  @override
  bool operator ==(Object other) {
    return other is CourseDetailControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
