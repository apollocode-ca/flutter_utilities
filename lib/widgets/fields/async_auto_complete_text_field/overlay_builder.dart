import 'package:apollocode_dart_utilities/src/models/type_paginated.dart';
import 'package:apollocode_flutter_utilities/notifications/items_notification.dart';
import 'package:apollocode_flutter_utilities/widgets/fields/async_auto_complete_text_field/async_overlay.dart';
import 'package:flutter/material.dart';

class OverlayBuilder<T> extends StatefulWidget {
  final BoxDecoration decoration;
  final RenderBox fieldRenderBox;
  final Widget Function(T) itemBuilder;
  final Color? itemHoverColor;
  final Curve? itemHoverCurve;
  final Duration? itemHoverDuration;
  final List<T> items;
  final LayerLink layerLink;
  final Widget loading;
  final void Function(T) onSubmit;
  final EdgeInsetsGeometry padding;
  final String query;
  final Future<Paginated<T>> Function(String) searchFutureProvider;
  final int selectedItemIndex;
  final bool shouldTriggerSearch;

  const OverlayBuilder({
    required this.decoration,
    required this.fieldRenderBox,
    required this.itemBuilder,
    this.itemHoverColor,
    this.itemHoverCurve,
    this.itemHoverDuration,
    required this.items,
    required this.layerLink,
    required this.loading,
    required this.onSubmit,
    required this.padding,
    required this.query,
    required this.searchFutureProvider,
    required this.selectedItemIndex,
    required this.shouldTriggerSearch,
    Key? key,
  }) : super(key: key);

  @override
  State<OverlayBuilder<T>> createState() => _State<T>();
}

class _State<T> extends State<OverlayBuilder<T>> {
  BoxDecoration get decoration {
    return widget.decoration;
  }

  RenderBox get fieldRenderBox {
    return widget.fieldRenderBox;
  }

  Widget Function(T) get itemBuilder {
    return widget.itemBuilder;
  }

  Color? get itemHoverColor {
    return widget.itemHoverColor;
  }

  Curve? get itemHoverCurve {
    return widget.itemHoverCurve;
  }

  Duration? get itemHoverDuration {
    return widget.itemHoverDuration;
  }

  List<T> get items {
    return widget.items;
  }

  LayerLink get layerLink {
    return widget.layerLink;
  }

  Widget get loading {
    return widget.loading;
  }

  void Function(T) get onSubmit {
    return widget.onSubmit;
  }

  EdgeInsetsGeometry get padding {
    return widget.padding;
  }

  String get query {
    return widget.query;
  }

  Future<Paginated<T>> Function(String) get searchFutureProvider {
    return widget.searchFutureProvider;
  }

  int get selectedItemIndex {
    return widget.selectedItemIndex;
  }

  bool get shouldTriggerSearch {
    return widget.shouldTriggerSearch;
  }

  @override
  Widget build(BuildContext context) {
    if (shouldTriggerSearch) {
      return FutureBuilder<Paginated<T>>(
        future: searchFutureProvider(query),
        builder: (context, snapshot) {
          var asyncItems = <T>[];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AsyncOverlay<T>(
              asyncItems: asyncItems,
              decoration: decoration,
              fieldRenderBox: fieldRenderBox,
              isBuilderMounted: mounted,
              isLoading: true,
              itemBuilder: itemBuilder,
              itemHoverColor: itemHoverColor,
              itemHoverCurve: itemHoverCurve,
              itemHoverDuration: itemHoverDuration,
              layerLink: layerLink,
              loading: loading,
              onSubmit: onSubmit,
              padding: padding,
              selectedItemIndex: selectedItemIndex,
              syncItems: items,
            );
          }
          final data = snapshot.data;
          if (data != null) {
            asyncItems = data.data;
          }
          ItemsNotification<T>(asyncItems).dispatch(context);
          return AsyncOverlay<T>(
            asyncItems: asyncItems,
            decoration: decoration,
            fieldRenderBox: fieldRenderBox,
            isBuilderMounted: mounted,
            itemBuilder: itemBuilder,
            itemHoverColor: itemHoverColor,
            itemHoverCurve: itemHoverCurve,
            itemHoverDuration: itemHoverDuration,
            layerLink: layerLink,
            loading: loading,
            onSubmit: onSubmit,
            padding: padding,
            selectedItemIndex: selectedItemIndex,
            syncItems: items,
          );
        },
      );
    }
    return AsyncOverlay<T>(
      decoration: decoration,
      fieldRenderBox: fieldRenderBox,
      isAsync: false,
      isBuilderMounted: mounted,
      itemBuilder: itemBuilder,
      itemHoverColor: itemHoverColor,
      itemHoverCurve: itemHoverCurve,
      itemHoverDuration: itemHoverDuration,
      layerLink: layerLink,
      loading: loading,
      onSubmit: onSubmit,
      padding: padding,
      selectedItemIndex: selectedItemIndex,
      syncItems: items,
    );
  }
}
