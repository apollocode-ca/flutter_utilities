import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  double scaleFontSizeFrom(DimensionsHelper helper) {
    return helper.scaleHeightFrom(
      figmaHeight: fontSize,
    );
  }

  double scaleHeightFrom(DimensionsHelper helper, double figmaHeight) {
    final scaledHeight = helper.scaleHeightFrom(
      figmaHeight: figmaHeight,
    );
    final scaledFontSize = scaleFontSizeFrom(helper);
    return scaledHeight / scaledFontSize;
  }
}
