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
      'assets/icons/lock_icon.svg',
      clipBehavior: Clip.antiAlias,
      package: 'apollocode_flutter_utilities',
    );
  }
}
