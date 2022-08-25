import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Clickable extends StatelessWidget {
  final Widget child;
  final SystemMouseCursor? cursor;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function(PointerHoverEvent)? onHover;
  final void Function() onTap;

  const Clickable({
    required this.child,
    this.cursor,
    this.onEnter,
    this.onExit,
    this.onHover,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cursor = this.cursor;
    if (cursor != null) {
      return MouseRegion(
        cursor: cursor,
        onEnter: onEnter,
        onExit: onExit,
        onHover: onHover,
        child: GestureDetector(
          onTap: onTap,
          child: child,
        ),
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
