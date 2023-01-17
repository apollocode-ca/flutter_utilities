import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/images/responsive_image.dart';
import 'package:flutter/material.dart';

class PartyPopperIcon extends StatelessWidget {
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final DimensionsHelper? helper;
  final Size? size;

  const PartyPopperIcon({
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.helper,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveImage(
      'assets/icons/party_popper_icon',
      alwaysUsePng: alwaysUsePng,
      alwaysUseSvg: alwaysUseSvg,
      clipBehavior: Clip.antiAlias,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      height: size?.height,
      helper: helper,
      package: 'apollocode_flutter_utilities',
      width: size?.width,
    );
  }
}
