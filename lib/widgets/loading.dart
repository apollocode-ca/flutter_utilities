import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadingAnimation { circle, hourglass, square }

class Loading extends StatelessWidget {
  final double size;
  final bool primary;
  final LoadingAnimation type;
  final bool hasBackground;

  const Loading(
      {this.size = 50,
      this.primary = true,
      this.hasBackground = false,
      this.type = LoadingAnimation.circle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (hasBackground)
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).canvasColor, width: 7),
                  borderRadius: BorderRadius.all(Radius.circular(size))),
            ),
          if (type == LoadingAnimation.hourglass)
            SpinKitHourGlass(
              color: (primary)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              size: size,
            ),

            if (type == LoadingAnimation.circle)
            SpinKitCircle(
              color: (primary)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              size: size,
            ),

            if (type == LoadingAnimation.square)
            SpinKitDancingSquare(
              color: (primary)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              size: size,
            ),
        ],
      ),
    );
  }
}
