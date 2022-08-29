import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension SizeExtension on Size {
  Size scaleWith(
    DimensionsHelper helper, {
    Size? maxSize,
    Size? minSize,
  }) {
    double? dimension;
    if (height == width && height != double.infinity) {
      dimension = helper.scaleRadiusFrom(
        figmaRadius: height,
        maxRadius: maxSize?.longestSide,
        minRadius: minSize?.shortestSide,
      );
    }
    final scaledHeight = helper.scaleHeightFrom(
      figmaSize: this,
      maxHeight: maxSize?.height,
      minHeight: minSize?.height,
    );
    final scaledWidth = helper.scaleWidthFrom(
      figmaSize: this,
      maxWidth: maxSize?.width,
      minWidth: minSize?.width,
    );
    return Size(
      dimension ?? scaledWidth,
      dimension ?? scaledHeight,
    );
  }
}
