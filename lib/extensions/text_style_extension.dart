import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  double scaleFontSizeFrom(
    DimensionsHelper helper, {
    double? maxFontSize,
    double? minFontSize,
  }) {
    return helper.scaleHeightFrom(
      figmaHeight: fontSize,
      maxHeight: maxFontSize,
      minHeight: minFontSize,
    );
  }

  double scaleHeightFrom(
    DimensionsHelper helper,
    double figmaHeight, {
    double? maxFontSize,
    double? maxHeight,
    double? minFontSize,
    double? minHeight,
  }) {
    final scaledHeight = helper.scaleHeightFrom(
      figmaHeight: figmaHeight,
      maxHeight: maxHeight,
      minHeight: minHeight,
    );
    final scaledFontSize = scaleFontSizeFrom(
      helper,
      maxFontSize: maxFontSize,
      minFontSize: minFontSize,
    );
    return scaledHeight / scaledFontSize;
  }
}
