import 'package:apollocode_flutter_utilities/widgets/fields/async_auto_complete_text_field/overlay_item.dart';
import 'package:flutter/material.dart';

class AsyncOverlay<T> extends StatefulWidget {
  final List<T>? asyncItems;
  final BoxDecoration decoration;
  final RenderBox fieldRenderBox;
  final bool isAsync;
  final bool isBuilderMounted;
  final bool isLoading;
  final Widget Function(T) itemBuilder;
  final Color? itemHoverColor;
  final Curve? itemHoverCurve;
  final Duration? itemHoverDuration;
  final LayerLink layerLink;
  final Widget loading;
  final void Function(T) onSubmit;
  final EdgeInsetsGeometry padding;
  final int selectedItemIndex;
  final List<T> syncItems;

  const AsyncOverlay({
    this.asyncItems,
    required this.decoration,
    required this.fieldRenderBox,
    this.isAsync = true,
    this.isLoading = false,
    required this.isBuilderMounted,
    required this.itemBuilder,
    this.itemHoverColor,
    this.itemHoverCurve,
    this.itemHoverDuration,
    required this.layerLink,
    required this.loading,
    required this.onSubmit,
    required this.padding,
    required this.selectedItemIndex,
    required this.syncItems,
    Key? key,
  }) : super(key: key);

  @override
  State<AsyncOverlay<T>> createState() => _State<T>();
}

class _State<T> extends State<AsyncOverlay<T>> {
  List<T> get asyncItems {
    return widget.asyncItems ?? <T>[];
  }

  Widget get child {
    if (isLoading) {
      return Center(
        child: loading,
      );
    }
    return Column(
      children: overlayItems.toList(),
    );
  }

  BoxConstraints get constraints {
    if (isLoading) {
      return BoxConstraints.tight(
        fieldRenderBox.size,
      );
    }
    return BoxConstraints.tightFor(
      width: fieldRenderBox.size.width,
    );
  }

  BoxDecoration get decoration {
    return widget.decoration;
  }

  RenderBox get fieldRenderBox {
    return widget.fieldRenderBox;
  }

  bool get isAsync {
    return widget.isAsync;
  }

  bool get isBuilderMounted {
    return widget.isBuilderMounted;
  }

  bool get isLoading {
    return widget.isLoading;
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
    if (isAsync) {
      return asyncItems;
    }
    return syncItems;
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

  Iterable<Widget> get overlayItems {
    return items.map((item) {
      return OverlayItem<T>(
        child: itemBuilder(item),
        hoverColor: itemHoverColor,
        hoverCurve: itemHoverCurve,
        hoverDuration: itemHoverDuration,
        isSelected: item == selectedItem,
        item: item,
        onTap: () {
          onTap(item);
        },
      );
    });
  }

  EdgeInsetsGeometry get padding {
    return widget.padding;
  }

  T? get selectedItem {
    if (selectedItemIndex != -1) {
      return items.elementAt(selectedItemIndex);
    }
    return null;
  }

  int get selectedItemIndex {
    return widget.selectedItemIndex;
  }

  List<T> get syncItems {
    return widget.syncItems;
  }

  void onTap(T item) {
    if (isBuilderMounted) {
      onSubmit(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: fieldRenderBox.size.width,
      child: CompositedTransformFollower(
        link: layerLink,
        offset: Offset(0, fieldRenderBox.size.height + 5),
        showWhenUnlinked: false,
        child: Container(
          constraints: constraints,
          decoration: decoration,
          padding: padding.subtract(
            const EdgeInsets.only(
              left: 9,
              right: 7,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
