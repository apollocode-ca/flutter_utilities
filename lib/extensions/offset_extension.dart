import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension OffsetExtension on Offset {
  Offset scaleWith(
    DimensionsHelper helper, {
    Offset? maxOffset,
    Offset? minOffset,
  }) {
    return Offset(
      helper.scaleWidthFrom(
        figmaWidth: dx,
        maxWidth: maxOffset?.dx,
        minWidth: minOffset?.dx,
      ),
      helper.scaleHeightFrom(
        figmaHeight: dy,
        maxHeight: maxOffset?.dy,
        minHeight: minOffset?.dy,
      ),
    );
  }
}
