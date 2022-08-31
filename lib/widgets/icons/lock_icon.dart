import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/images/responsive_image.dart';
import 'package:flutter/material.dart';

class LockIcon extends StatefulWidget {
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final DimensionsHelper? helper;
  final Size? size;

  const LockIcon({
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.helper,
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  State<LockIcon> createState() => _State();
}

class _State extends State<LockIcon> {
  bool get alwaysUsePng {
    return widget.alwaysUsePng;
  }

  bool get alwaysUseSvg {
    return widget.alwaysUseSvg;
  }

  DimensionsHelper? get helper {
    return widget.helper;
  }

  Widget get icon {
    return ResponsiveImage(
      'assets/icons/lock_icon',
      alwaysUsePng: alwaysUsePng,
      alwaysUseSvg: alwaysUseSvg,
      clipBehavior: Clip.antiAlias,
      filterQuality: FilterQuality.high,
      helper: helper,
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
