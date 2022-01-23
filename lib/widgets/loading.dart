import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final double size;
  final bool primary;
  final bool hasBackground;

  const Loading(
      {this.size = 50,
      this.primary = true,
      this.hasBackground = false,
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
          SpinKitHourGlass(
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
