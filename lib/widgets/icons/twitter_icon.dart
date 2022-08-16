import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TwitterIcon extends StatefulWidget {
  final Color? color;

  const TwitterIcon({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<TwitterIcon> createState() => _State();
}

class _State extends State<TwitterIcon> {
  Color? get color {
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/twitter_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      package: 'apollocode_flutter_utilities',
    );
  }
}
