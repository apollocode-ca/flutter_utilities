import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Clickable extends StatelessWidget {
  final Widget child;
  final SystemMouseCursor cursor;
  final VoidCallback onTap;
  final Function(PointerHoverEvent)? onHover;

  const Clickable({
    required this.child,
    required this.cursor,
    required this.onTap,
    this.onHover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onHover: onHover,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
