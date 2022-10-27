import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/images/responsive_image.dart';
import 'package:flutter/material.dart';

class MicrosoftIcon extends StatelessWidget {
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final DimensionsHelper? helper;
  final Size? size;

  const MicrosoftIcon({
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.helper,
    Key? key,
    this.size,
  }) : super(key: key);

  Widget get _icon {
    return ResponsiveImage(
      'assets/icons/microsoft_icon',
      alwaysUsePng: alwaysUsePng,
      alwaysUseSvg: alwaysUseSvg,
      clipBehavior: Clip.antiAlias,
      filterQuality: FilterQuality.high,
      helper: helper,
      package: 'apollocode_flutter_utilities',
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = this.size;
    if (size != null) {
      return ConstrainedBox(
        constraints: BoxConstraints.tight(size),
        child: _icon,
      );
    }
    return _icon;
  }
}
