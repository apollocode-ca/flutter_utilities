import 'package:flutter/material.dart';

class ChildSizeProvider extends StatefulWidget {
  final Widget child;
  final Function(Size size) onBuildDone;

  const ChildSizeProvider({
    required this.onBuildDone,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<ChildSizeProvider> createState() => _State();
}

class _State extends State<ChildSizeProvider> {
  var size = Size.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (mounted) {
        final currentSize = context.size;
        if (currentSize != null && currentSize.shortestSide != 0) {
          final oldSize = size;
          size = currentSize;
          if (oldSize != currentSize) {
            widget.onBuildDone(size);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
