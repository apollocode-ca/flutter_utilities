import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LockIcon extends StatefulWidget {
  final Size? size;

  const LockIcon({
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<LockIcon> createState() => _State();
}

class _State extends State<LockIcon> {
  Widget get icon {
    return SvgPicture.asset(
      'assets/icons/lock_icon.svg',
      clipBehavior: Clip.antiAlias,
      package: 'apollocode_flutter_utilities',
    );
  }

  Size? get size {
    return widget.size;
  }

  @override
  Widget build(BuildContext context) {
    final size = this.size;
    if (size != null) {
      return ConstrainedBox(
        child: icon,
        constraints: BoxConstraints.loose(size),
      );
    }
    return icon;
  }
}
