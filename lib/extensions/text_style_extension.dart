import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  double scaleFontSizeForCurrentMedia() {
    final helper = DimensionsHelper.instance;
    return helper.scaleHeightFrom(
      figmaHeight: fontSize,
    );
  }

  double scaleHeightForCurrentMediaWith(double figmaHeight) {
    final helper = DimensionsHelper.instance;
    final scaledHeight = helper.scaleHeightFrom(
      figmaHeight: figmaHeight,
    );
    final scaledFontSize = scaleFontSizeForCurrentMedia();
    return scaledHeight / scaledFontSize;
  }
}
