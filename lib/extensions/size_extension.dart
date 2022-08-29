import 'dart:math';

import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension SizeExtension on Size {
  double get maxDimension {
    return max(height, width);
  }

  double get minDimension {
    return min(height, width);
  }

  Size scaleWith(
    DimensionsHelper helper, {
    Size? maxSize,
    Size? minSize,
  }) {
    double? dimension;
    if (height == width) {
      dimension = helper.scaleRadiusFrom(
        figmaRadius: height,
        maxRadius: maxSize?.maxDimension,
        minRadius: minSize?.minDimension,
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
