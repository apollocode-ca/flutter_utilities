import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:apollocode_flutter_utilities/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:apollocode_flutter_utilities/extensions/async_snapshot_extension.dart';

export 'package:apollocode_flutter_utilities/extensions/async_snapshot_extension.dart';

/// Protects a front-end route from inexistant needed data.
///
/// Provides a simple way to fetch data needed by a front-end route and to
/// display the current state of the data (already fetched, loading, not found
/// and successfully fetched).
///
/// The generic type T of the data contained in the Guard should be
/// **Cloneable**. Any other type will throw an [UnsupportedError] when the data
/// will be fetched by the Guard.
///
/// Only the [body] of the route and the data [future] are needed for the Guard
/// to work as expected, but [onDataAlreadyFetched], [onDataFetched],
/// [onDataLoading] and [onDataNotFound] can be optionally used to personalize
/// how the Guard should work.
class Guard<T extends Cloneable> extends StatefulWidget {
  /// The body of the guarded route.
  final Widget body;

  /// The data future.
  final Future<T> future;

  /// Executed when the data has been already fetched by the guard.
  ///
  /// The return type can be:
  ///
  ///  * **Widget**: if you want to change the default widget used when the data
  ///     has already been fetched.
  ///  * **T**: if you want to alter in any way the data in the Guard (but if
  ///     you want to clear the data, use instead [GuardState.clear]).
  ///  * **void**: if you only want to run any extra processes when the Guard is
  ///     rebuilding.
  ///
  /// Any other return type will be ignored.
  final dynamic Function(T data)? onDataAlreadyFetched;

  /// Executed when the data has been successfully fetched.
  ///
  /// Is happening when the Guard is building for the first time or when the
  /// data has been cleared.
  ///
  /// The return type can be:
  ///
  ///  * **Widget**: if you want to change the default widget used when the data
  ///     has been successfully fetched.
  ///  * **T**: if you want to alter in any way the data in the Guard.
  ///  * **void**: if you only want to run any extra processes after the data
  ///     has been successfully fetched.
  ///
  /// Any other return type will be ignored.
  final dynamic Function(T data)? onDataFetched;

  /// Executed when the data is loading.
  ///
  /// The return type can be:
  ///
  ///  * **Widget**: if you want to change the default widget used when the data
  ///     is loading.
  ///  * **void**: if you only want to run any extra processes while the data is
  ///     loading.
  ///
  /// Any other return type will be ignored.
  final dynamic Function()? onDataLoading;

  /// Executed when the data has not been found.
  ///
  /// The return type can be:
  ///
  /// * **Widget**: if you want to change the default widget used when the data
  ///     has not been found.
  /// * **void**: if you only want to run any extra processes when the data has
  ///     not been found.
  ///
  /// Any other return type will be ignored.
  final dynamic Function()? onDataNotFound;

  const Guard({
    required this.body,
    required this.future,
    this.onDataAlreadyFetched,
    this.onDataFetched,
    this.onDataLoading,
    this.onDataNotFound,
    Key? key,
  }) : super(key: key);

  /// Access the data inside the [Guard], using the [context].
  ///
  /// The data is a copy of what's inside the [GuardState].
  ///
  /// You can use the following line to get a copy of the T data in any widget
  /// that has a [Guard] of T as ancestor:
  ///
  /// ```dart
  /// final t = Guard.of<T>(context);
  /// ```
  ///
  /// A [StateError] will throw if there is no [Guard] of T ancestor for the
  /// widget that tries to access the T data.
  static T of<T extends Cloneable>(BuildContext context) {
    final guard = context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    if (guard == null) {
      throw StateError('No "Guard<$T>" ancestor found');
    }
    return guard.data.copyWith() as T;
  }

  /// Access the state of the [Guard], using the [context].
  ///
  /// You can use the following line to get the state of the [Guard] in any
  /// widget that has a [Guard] as ancestor:
  ///
  /// ```dart
  /// final state = Guard.stateOf<T>(context);
  /// ```
  ///
  /// A [StateError] will throw if there is no [Guard] ancestor for the widget
  /// that tries to access the state.
  ///
  /// Use the state of the Guard to access its public methods.
  ///
  /// If you rather want to access the data in the state, use [Guard.of].
  static GuardState<T> stateOf<T extends Cloneable>(BuildContext context) {
    final guard = context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    if (guard == null) {
      throw StateError('No "Guard<$T>" ancestor found');
    }
    return guard.state;
  }

  @override
  State<Guard<T>> createState() => GuardState<T>();
}

class GuardState<T extends Cloneable> extends State<Guard<T>> {
  T? _data;

  /// Clears the data contained in the [GuardState].
  ///
  /// A [setState] is done to trigger a rebuild of the entire [Guard], which
  /// will trigger a new data fetching.
  ///
  /// Can be used with the following line:
  ///
  /// ```dart
  /// Guard.stateOf<T>(context).clear();
  /// ```
  void clear() {
    setState(() {
      _data = null;
    });
  }

  void _replaceData(T data) {
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    final data = _data;
    if (data != null) {
      return _DataAlreadyFetchedHandler<T>(
        body: widget.body,
        data: data,
        externCall: widget.onDataAlreadyFetched,
        replaceData: _replaceData,
        state: this,
      )();
    }
    return FutureBuilder<T>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.isLoading) {
          return _DataLoadingHandler(
            externCall: widget.onDataLoading,
          )();
        }
        final data = snapshot.data;
        if (data == null) {
          return _DataNotFoundHandler(
            externCall: widget.onDataNotFound,
          )();
        }
        return _DataFetchedHandler<T>(
          body: widget.body,
          data: data,
          externCall: widget.onDataFetched,
          replaceData: _replaceData,
          state: this,
        )();
      },
    );
  }

  @override
  bool operator ==(Object? other) {
    if (identical(other, this)) {
      return true;
    }
    return other is GuardState<T> && other._data == _data;
  }

  @override
  int get hashCode {
    return _data.hashCode;
  }
}

class _Inherited<T extends Cloneable> extends InheritedWidget {
  final T data;
  final GuardState<T> state;

  const _Inherited({
    required this.data,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _Inherited<T> oldWidget) {
    return oldWidget.state != state;
  }
}

class _DataAlreadyFetchedHandler<T extends Cloneable> {
  final Widget body;
  final dynamic Function(T data)? externCall;
  final void Function(T data) replaceData;
  final GuardState<T> state;

  late T data;

  _DataAlreadyFetchedHandler({
    required this.body,
    required this.data,
    required this.externCall,
    required this.replaceData,
    required this.state,
  });

  Widget call() {
    final externCall = this.externCall;
    var child = body;
    if (externCall != null) {
      final result = externCall(data);
      child = _handle(result);
    }
    replaceData(data);
    return _Inherited(
      data: data,
      state: state,
      child: child,
    );
  }

  Widget _handle(dynamic result) {
    if (result is Widget) {
      return result;
    }
    if (result is T) {
      data = result;
    }
    return body;
  }
}

class _DataFetchedHandler<T extends Cloneable> {
  final Widget body;
  final dynamic Function(T data)? externCall;
  final void Function(T data) replaceData;
  final GuardState<T> state;

  late T data;

  _DataFetchedHandler({
    required this.body,
    required this.data,
    required this.externCall,
    required this.replaceData,
    required this.state,
  });

  Widget call() {
    final externCall = this.externCall;
    var child = body;
    if (externCall != null) {
      final result = externCall(data);
      child = _handle(result);
    }
    replaceData(data);
    return _Inherited(
      data: data,
      state: state,
      child: child,
    );
  }

  Widget _handle(dynamic result) {
    if (result is Widget) {
      return result;
    }
    if (result is T) {
      data = result;
    }
    return body;
  }
}

class _DataLoadingHandler {
  static const defaultChild = Loading();

  final dynamic Function()? externCall;

  const _DataLoadingHandler({
    required this.externCall,
  });

  Widget call() {
    final externCall = this.externCall;
    Widget child = defaultChild;
    if (externCall != null) {
      final result = externCall();
      child = _handle(result);
    }
    return child;
  }

  Widget _handle(dynamic result) {
    if (result is Widget) {
      return result;
    }
    return defaultChild;
  }
}

class _DataNotFoundHandler {
  static const defaultChild = NotFound();

  final dynamic Function()? externCall;

  const _DataNotFoundHandler({
    required this.externCall,
  });

  Widget call() {
    final externCall = this.externCall;
    Widget child = defaultChild;
    if (externCall != null) {
      final result = externCall();
      child = _handle(result);
    }
    return child;
  }

  Widget _handle(dynamic result) {
    if (result is Widget) {
      return result;
    }
    return defaultChild;
  }
}
