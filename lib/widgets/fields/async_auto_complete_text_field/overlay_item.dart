import 'package:apollocode_flutter_utilities/notifications/selected_item_notification.dart';
import 'package:apollocode_flutter_utilities/widgets/clickable.dart';
import 'package:flutter/material.dart';

class OverlayItem<T> extends StatefulWidget {
  final Widget child;
  final Color? hoverColor;
  final Curve? hoverCurve;
  final Duration? hoverDuration;
  final bool isSelected;
  final T item;
  final void Function() onTap;

  const OverlayItem({
    required this.child,
    this.hoverColor,
    this.hoverCurve,
    this.hoverDuration,
    required this.isSelected,
    required this.item,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<OverlayItem> createState() => _State<T>();
}

class _State<T> extends State<OverlayItem> {
  Color boxColor = Colors.transparent;

  Widget get child {
    return widget.child;
  }

  Color get color {
    if (isSelected) {
      return hoverColor;
    }
    return boxColor;
  }

  Color get hoverColor {
    return widget.hoverColor ?? Colors.transparent;
  }

  Curve get hoverCurve {
    return widget.hoverCurve ?? Curves.linear;
  }

  Duration get hoverDuration {
    return widget.hoverDuration ?? Duration.zero;
  }

  bool get isSelected {
    return widget.isSelected;
  }

  T get item {
    return widget.item;
  }

  void Function() get onTap {
    return widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      SelectedItemNotification<T>(item).dispatch(context);
    }
    return Row(
      children: [
        Expanded(
          child: Clickable(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              setState(() {
                boxColor = hoverColor;
              });
            },
            onExit: (_) {
              setState(() {
                boxColor = Colors.transparent;
              });
            },
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: AnimatedContainer(
                curve: hoverCurve,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: color,
                ),
                duration: hoverDuration,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
