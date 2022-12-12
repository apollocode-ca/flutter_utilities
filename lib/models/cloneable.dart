import '../guards/guard.dart';

/// Defines how a class should be cloned.
///
/// The generic [Guard] uses [Cloneable] to keep its data read-only.
///
/// Concrete classes which inherit from [Cloneable] must also override the [==]
/// operator and the [hashCode] getter.
abstract class Cloneable<T> {
  /// Specify how to clone the concrete class.
  T clone();

  // "other" is a nullable object (Object?) to force the override in all the
  // concrete classes.
  //
  // DO NOT CHANGE THIS!
  @override
  bool operator ==(Object? other);

  @override
  int get hashCode;
}
