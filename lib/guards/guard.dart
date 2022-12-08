import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:apollocode_flutter_utilities/widgets/not_found.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:apollocode_flutter_utilities/extensions/async_snapshot_extension.dart';

export 'package:apollocode_flutter_utilities/extensions/async_snapshot_extension.dart';

class Guard<T> extends StatefulWidget {
  final Widget body;
  final Future<T> future;
  final dynamic Function(T object)? onDataAlreadyFetched;
  final dynamic Function(T object)? onDataFetched;
  final dynamic Function()? onDataLoading;
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

  static T of<T>(BuildContext context) {
    final guard = context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    if (guard == null) {
      throw StateError('No Guard<$T> ancestor found');
    }
    return guard.object;
  }

  @override
  State<Guard<T>> createState() => GuardState<T>();
}

class GuardState<T> extends State<Guard<T>> {
  T? object;

  Widget onDataAlreadyFetched(T object) {
    final function = widget.onDataAlreadyFetched;
    if (function != null) {
      final result = function(object);
      if (result is Widget) {
        return result;
      }
    }
    return _Inherited(
      object: object,
      child: widget.body,
    );
  }

  void onDataFetched(T object) {
    final function = widget.onDataFetched;
    if (function != null) {
      function(object);
    }
  }

  void onDataLoading() {
    final function = widget.onDataLoading;
    if (function != null) {
      function();
    }
  }

  void onDataNotFound() {
    final function = widget.onDataNotFound;
    if (function != null) {
      function();
    }
  }

  @override
  Widget build(BuildContext context) {
    final object = this.object;
    if (object != null) {
      onDataAlreadyFetched(object);
      return _Inherited(
        object: object,
        child: widget.body,
      );
    }
    return FutureBuilder<T>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.isLoading) {
          onDataLoading();
          return const Loading();
        }
        final object = snapshot.data;
        if (object == null) {
          onDataNotFound();
          return const NotFound();
        }
        this.object = object;
        onDataFetched(object);
        return _Inherited(
          object: object,
          child: widget.body,
        );
      },
    );
  }
}

class _Inherited<T> extends InheritedWidget {
  static const collectionEquality = DeepCollectionEquality();

  final T object;

  const _Inherited({
    required this.object,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _Inherited<T> oldWidget) {
    if (object is Iterable || object is Map) {
      collectionEquality.equals(oldWidget.object, object);
    }
    return oldWidget.object != object;
  }
}
