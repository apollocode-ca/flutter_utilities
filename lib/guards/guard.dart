import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:apollocode_flutter_utilities/managers/local_store.dart';
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
///
/// The [future] can return any type of data (even non Cloneable ones). However,
/// when the [future] returns data that is not of type T, the [dataSetter] must
/// be provided.
///
/// By default, the data in the Guard is not saved in the local store.
class Guard<T extends Cloneable> extends StatefulWidget {
  /// The body of the guarded route.
  final Widget body;

  /// Optional setter when the future is not the same type than the [Guard].
  ///
  /// Must be provided if the future doesn't return T.
  final T Function(dynamic value)? dataSetter;

  /// The data future.
  final Future<dynamic> future;

  /// Additional verifications done on the data when it has already been
  /// fetched.
  ///
  /// Useful to add conditions that invalidate the data, which can trigger new
  /// fetches.
  ///
  /// By default, the [Guard] only checks if the data exists.
  final bool Function(T data)? isDataAlreadyFetched;

  /// The data will be saved in the local store when the data is fetched if the
  /// key is not null.
  ///
  /// If the key is null, the step to save the data in the local store will be
  /// ignored.
  final String? localStoreKey;

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
    this.dataSetter,
    required this.future,
    this.isDataAlreadyFetched,
    this.localStoreKey,
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
  /// A [setState] is done to trigger an rebuild of the entire [Guard], which
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

  /// Updates the data contained in the [GuardState].
  ///
  /// A [setState] is done to trigger a rebuild of the entire [Guard].
  ///
  /// Can be used with the following line:
  ///
  /// ```dart
  /// Guard.stateOf<T>(context).update(data);
  /// ```
  void update(T data) {
    setState(() {
      _data = data.copyWith() as T;
    });
  }

  bool _isDataAlreadyFetched(T data) {
    final isDataAlreadyFetched = widget.isDataAlreadyFetched;
    if (isDataAlreadyFetched != null) {
      return isDataAlreadyFetched(data);
    }
    return true;
  }

  void _replaceData(T data) {
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    final data = _data;
    if (data != null && _isDataAlreadyFetched(data)) {
      return _DataAlreadyFetchedHandler<T>(
        body: widget.body,
        data: data,
        externCall: widget.onDataAlreadyFetched,
        replaceData: _replaceData,
        state: this,
      )();
    }
    final localStoreKey = widget.localStoreKey;
    T? initialData;
    if (localStoreKey != null) {
      initialData = LocalStoreManager.instance.getValue(localStoreKey);
    }
    return FutureBuilder<dynamic>(
      future: widget.future,
      initialData: initialData,
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
          dataSetter: widget.dataSetter,
          externCall: widget.onDataFetched,
          localStoreKey: widget.localStoreKey,
          replaceData: _replaceData,
          state: this,
        )();
      },
    );
  }

  @override
  bool operator ==(Object? other) {
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
    return true;
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
  final T Function(dynamic data)? dataSetter;
  final dynamic Function(T data)? externCall;
  final String? localStoreKey;
  final void Function(T data) replaceData;
  final GuardState<T> state;

  late dynamic data;

  _DataFetchedHandler({
    required this.body,
    required this.data,
    required this.dataSetter,
    required this.externCall,
    required this.localStoreKey,
    required this.replaceData,
    required this.state,
  });

  Widget call() {
    final externCall = this.externCall;
    final data = _handleData();
    var child = body;
    if (externCall != null) {
      final result = externCall(data);
      child = _handleResult(result);
    }
    final localStoreKey = this.localStoreKey;
    if (localStoreKey != null) {
      LocalStoreManager.instance.setValue(localStoreKey, data);
    }
    replaceData(data);
    return _Inherited(
      data: data,
      state: state,
      child: child,
    );
  }

  T _handleData() {
    if (data is T) {
      return data;
    }
    final dataSetter = this.dataSetter;
    if (dataSetter != null) {
      return dataSetter(data);
    }
    throw StateError(
      'The "dataSetter" property must be provided when the "future" does\'t '
      'return T.',
    );
  }

  Widget _handleResult(dynamic result) {
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
