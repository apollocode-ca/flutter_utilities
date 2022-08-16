import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramIcon extends StatefulWidget {
  final Color? color;

  const InstagramIcon({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<InstagramIcon> createState() => _State();
}

class _State extends State<InstagramIcon> {
  Color? get color {
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/instagram_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      package: 'apollocode_flutter_utilities',
    );
  }
}
