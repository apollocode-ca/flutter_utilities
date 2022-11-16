import 'package:flutter/material.dart';

class ChildSizeProvider extends StatefulWidget {
  final Widget child;
  final Function(Size size) onBuildDone;
  final bool shouldGetSizeOnEveryBuild;

  const ChildSizeProvider({
    required this.onBuildDone,
    this.shouldGetSizeOnEveryBuild = false,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<ChildSizeProvider> createState() => _State();
}

class _State extends State<ChildSizeProvider> {
  void onFirstBuildDone() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = context.size;
      if (size != null) {
        widget.onBuildDone(size);
      }
    });
  }

  void onEachBuildDone() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      final size = context.size;
      if (size != null) {
        widget.onBuildDone(size);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.shouldGetSizeOnEveryBuild) {
      onEachBuildDone();
    } else {
      onFirstBuildDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
