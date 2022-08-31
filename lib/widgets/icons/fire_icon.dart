import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/images/responsive_image.dart';
import 'package:flutter/material.dart';

class FireIcon extends StatefulWidget {
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final DimensionsHelper? helper;

  const FireIcon({
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.helper,
    Key? key,
  }) : super(key: key);

  @override
  State<FireIcon> createState() => _State();
}

class _State extends State<FireIcon> {
  bool get alwaysUsePng {
    return widget.alwaysUsePng;
  }

  bool get alwaysUseSvg {
    return widget.alwaysUseSvg;
  }

  DimensionsHelper? get helper {
    return widget.helper;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveImage(
      'assets/icons/fire_icon',
      alwaysUsePng: alwaysUsePng,
      alwaysUseSvg: alwaysUseSvg,
      clipBehavior: Clip.antiAlias,
      filterQuality: FilterQuality.high,
      helper: helper,
      package: 'apollocode_flutter_utilities',
    );
  }
}
