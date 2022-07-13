import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Clickable extends StatelessWidget {
  final Widget child;
  final SystemMouseCursor cursor;
  final VoidCallback onTap;

  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function(PointerHoverEvent)? onHover;

  const Clickable({
    required this.child,
    required this.cursor,
    required this.onTap,
    this.onEnter,
    this.onExit,
    this.onHover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
