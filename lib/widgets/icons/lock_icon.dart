import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LockIcon extends StatefulWidget {
  const LockIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<LockIcon> createState() => _State();
}

class _State extends State<LockIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'icons/lock_icon.svg',
      package: 'apollocode_flutter_utilities',
      clipBehavior: Clip.antiAlias,
    );
  }
}
