import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FireIcon extends StatefulWidget {
  const FireIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<FireIcon> createState() => _State();
}

class _State extends State<FireIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/fire_icon.svg',
      clipBehavior: Clip.antiAlias,
      package: 'apollocode_flutter_utilities',
    );
  }
}
