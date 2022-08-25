import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension SizeExtension on Size {
  Size scaleWith(
    DimensionsHelper helper, {
    Size? maxSize,
    Size? minSize,
  }) {
    return Size(
      helper.scaleWidthFrom(
        figmaSize: this,
        maxWidth: maxSize?.width,
        minWidth: minSize?.width,
      ),
      helper.scaleHeightFrom(
        figmaSize: this,
        maxHeight: maxSize?.height,
        minHeight: minSize?.height,
      ),
    );
  }
}
