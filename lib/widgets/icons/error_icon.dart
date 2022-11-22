import 'package:flutter/material.dart';

class ErrorIcon extends StatelessWidget {
  final Color? color;
  final BoxConstraints? constraints;

  const ErrorIcon({
    this.color,
    this.constraints,
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
