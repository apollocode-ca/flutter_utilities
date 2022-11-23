import 'dart:async';

import 'package:apollocode_flutter_utilities/notifications/items_notification.dart';
import 'package:apollocode_flutter_utilities/notifications/selected_item_notification.dart';
import 'package:apollocode_flutter_utilities/widgets/fields/async_auto_complete_text_field/overlay_builder.dart';
import 'package:flutter/material.dart';
import 'package:apollocode_dart_utilities/src/models/type_paginated.dart';
import 'package:flutter/services.dart';

class AsyncAutoCompleteTextField<T> extends StatefulWidget {
  final InputDecoration fieldDecoration;
  final Widget loading;
  final int maxSuggestions;
  final void Function(T?) onOverlayItemSubmit;
  final void Function(String, List<T>) onQuerySubmit;
  final BoxDecoration overlayDecoration;
  final Widget Function(T) overlayItemBuilder;
  final bool Function(T, String) overlayItemFilter;
  final Color? overlayItemHoverColor;
  final Curve? overlayItemHoverCurve;
  final Duration? overlayItemHoverDuration;
  final int Function(T, T) overlayItemSorter;
  final Future<Paginated<T>> Function(String) searchFutureProvider;
  final TextStyle? style;

  AsyncAutoCompleteTextField({
    this.fieldDecoration = const InputDecoration(
      constraints: BoxConstraints.expand(
        height: 40,
      ),
    ),
    required this.loading,
    required this.maxSuggestions,
    required this.onOverlayItemSubmit,
    required this.onQuerySubmit,
    required this.overlayDecoration,
    required this.overlayItemBuilder,
    required this.overlayItemFilter,
    this.overlayItemHoverColor,
    this.overlayItemHoverCurve,
    this.overlayItemHoverDuration,
    required this.searchFutureProvider,
    required this.overlayItemSorter,
    this.style,
    Key? key,
  }) : super(
          key: GlobalKey<_State<T>>(
            debugLabel: key?.toString(),
          ),
        );

  @override
  State<StatefulWidget> createState() => _State<T>();
}

class _State<T> extends State<AsyncAutoCompleteTextField<T>> {
  final layerLink = LayerLink();

  late TextEditingController controller;
  late FocusNode fieldFocusNode;
  late FocusNode keyboardListenerFocusNode;

  bool isLoading = false;
  List<T> items = [];
  int selectedOverlayItemIndex = -1;
  bool showCursor = true;

  OverlayEntry? overlayEntry;
  T? selectedItem;
  Timer? timer;

  InputDecoration get fieldDecoration {
    return widget.fieldDecoration;
  }

  Widget get loading {
    return widget.loading;
  }

  int get maxSuggestions {
    return widget.maxSuggestions;
  }

  void Function(T?) get onOverlayItemSubmit {
    return widget.onOverlayItemSubmit;
  }

  void Function(String, List<T>) get onQuerySubmit {
    return widget.onQuerySubmit;
  }

  BoxDecoration get overlayDecoration {
    return widget.overlayDecoration.copyWith(
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        const BoxShadow(
          blurRadius: 5,
          color: Colors.black38,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  Widget Function(T) get overlayItemBuilder {
    return widget.overlayItemBuilder;
  }

  bool Function(T, String) get overlayItemFilter {
    return widget.overlayItemFilter;
  }

  Color? get overlayItemHoverColor {
    return widget.overlayItemHoverColor;
  }

  Curve? get overlayItemHoverCurve {
    return widget.overlayItemHoverCurve;
  }

  Duration? get overlayItemHoverDuration {
    return widget.overlayItemHoverDuration;
  }

  int Function(T, T) get overlayItemSorter {
    return widget.overlayItemSorter;
  }

  Future<Paginated<T>> Function(String) get searchFutureProvider {
    return widget.searchFutureProvider;
  }

  TextStyle? get style {
    return widget.style;
  }

  void clear() {
    controller.clear();
    selectedOverlayItemIndex = -1;
    setState(() {
      showCursor = true;
    });
    hideOverlay();
  }

  OverlayEntry createOverlay(bool shouldTriggerSearch) {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        final fieldRenderObject = context.findRenderObject();
        final fieldRenderBox =
            fieldRenderObject != null ? fieldRenderObject as RenderBox : null;
        return NotificationListener(
          onNotification: (notification) {
            if (notification is SelectedItemNotification<T>) {
              selectedItem = notification.value;
            } else if (notification is ItemsNotification<T>) {
              items = notification.values;
            }
            return true;
          },
          child: OverlayBuilder(
            decoration: overlayDecoration,
            fieldRenderBox: fieldRenderBox,
            itemBuilder: overlayItemBuilder,
            itemHoverColor: overlayItemHoverColor,
            itemHoverCurve: overlayItemHoverCurve,
            itemHoverDuration: overlayItemHoverDuration,
            items: items,
            layerLink: layerLink,
            loading: loading,
            onSubmit: onOverlayItemSubmit,
            padding: fieldDecoration.contentPadding ?? EdgeInsets.zero,
            query: controller.text,
            searchFutureProvider: searchFutureProvider,
            selectedItemIndex: selectedOverlayItemIndex,
            shouldTriggerSearch: shouldTriggerSearch,
          ),
        );
      },
    );
  }

  void delaySearch(String query) {
    if (query.isNotEmpty) {
      restartTimer();
    } else {
      timer?.cancel();
      hideOverlay();
    }
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void onArrowDownPressDown() {
    if (selectedOverlayItemIndex < items.length - 1) {
      selectedOverlayItemIndex += 1;
    }
    updateOverlay();
  }

  void onArrowDownPressUp() {
    if (selectedOverlayItemIndex == 0) {
      setState(() {
        showCursor = false;
      });
    }
  }

  void onArrowUpPressDown() {
    if (selectedOverlayItemIndex > -1) {
      selectedOverlayItemIndex -= 1;
    }
    updateOverlay();
  }

  void onArrowUpPressUp() {
    if (selectedOverlayItemIndex == -1 && !showCursor) {
      controller.selection = TextSelection.collapsed(
        offset: controller.text.length,
      );
      setState(() {
        showCursor = true;
      });
    }
  }

  void restartTimer() {
    hideOverlay();
    timer?.cancel();
    timer = Timer(
      const Duration(
        milliseconds: 200,
      ),
      () {
        updateOverlay(
          shouldTriggerSearch: true,
        );
      },
    );
  }

  void showOverlay(bool shouldTriggerSearch) {
    overlayEntry?.remove();
    overlayEntry = createOverlay(shouldTriggerSearch);
    Overlay.of(context)?.insert(overlayEntry!);
    overlayEntry?.markNeedsBuild();
  }

  void submitQuery(String submittedQuery) {
    onQuerySubmit(submittedQuery, items);
    clear();
  }

  void updateOverlay({
    bool shouldTriggerSearch = false,
  }) {
    if (controller.text.isNotEmpty) {
      showOverlay(shouldTriggerSearch);
    } else {
      hideOverlay();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    fieldFocusNode = FocusNode();
    keyboardListenerFocusNode = FocusNode();
    fieldFocusNode.addListener(() {
      if (!fieldFocusNode.hasFocus) {
        selectedOverlayItemIndex = -1;
        setState(() {
          showCursor = true;
        });
        hideOverlay();
      } else {
        updateOverlay();
      }
    });
  }

  @override
  void dispose() {
    keyboardListenerFocusNode.dispose();
    fieldFocusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: KeyboardListener(
        focusNode: keyboardListenerFocusNode,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              onArrowDownPressDown();
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              onArrowUpPressDown();
            }
          }
          if (event is KeyUpEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              onArrowDownPressUp();
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              onArrowUpPressUp();
            }
          }
        },
        child: TextField(
          controller: controller,
          cursorColor: style?.color,
          cursorRadius: const Radius.circular(2),
          cursorWidth: 2,
          decoration: fieldDecoration,
          focusNode: fieldFocusNode,
          onChanged: delaySearch,
          onSubmitted: (submittedText) {
            if (selectedOverlayItemIndex != -1) {
              onOverlayItemSubmit(selectedItem);
            } else {
              submitQuery(submittedText);
            }
          },
          showCursor: showCursor,
          style: style,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
