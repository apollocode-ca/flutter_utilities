import 'package:flutter/material.dart';

class ErrorIcon extends StatelessWidget {
  final BoxConstraints? constraints;
  final Color? color;

  const ErrorIcon({
    this.constraints,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      child: Image.asset(
        'assets/icons/error_icon.png',
        color: color,
        filterQuality: FilterQuality.high,
        package: 'apollocode_flutter_utilities',
      ),
    );
  }
}
