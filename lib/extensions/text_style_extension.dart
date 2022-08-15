import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  double scaleFontSizeFrom(BuildContext context, [Size? figmaFrameSize]) {
    final helper = DimensionsHelper.getInstance(context, figmaFrameSize);
    return helper.scaleHeightFrom(
      figmaHeight: fontSize,
    );
  }

  double scaleHeightFrom(
    double figmaHeight,
    BuildContext context, [
    Size? figmaFrameSize,
  ]) {
    final helper = DimensionsHelper.getInstance(context, figmaFrameSize);
    final scaledHeight = helper.scaleHeightFrom(
      figmaHeight: figmaHeight,
    );
    final scaledFontSize = scaleFontSizeFrom(context, figmaFrameSize);
    return scaledHeight / scaledFontSize;
  }
}
