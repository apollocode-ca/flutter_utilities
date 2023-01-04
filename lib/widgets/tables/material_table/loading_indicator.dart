import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final double size;

  const LoadingIndicator({
    required this.size,
    super.key,
  });

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Tween<double> tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    tween = Tween(
      begin: controller.lowerBound,
      end: controller.upperBound,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: tween.animate(controller),
      child: Icon(
        Icons.autorenew_rounded,
        color: Theme.of(context).colorScheme.onBackground,
        size: widget.size,
      ),
    );
  }
}
