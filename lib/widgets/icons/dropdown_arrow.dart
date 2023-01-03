import 'package:flutter/material.dart';

class DropdownArrow extends StatelessWidget {
  final Color? color;
  final BoxConstraints? constraints;

  const DropdownArrow({
    this.color,
    this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      child: Image.asset(
        'assets/icons/dropdown_arrow_down.png',
        color: color,
        filterQuality: FilterQuality.high,
        package: 'apollocode_flutter_utilities',
      ),
    );
  }
}
