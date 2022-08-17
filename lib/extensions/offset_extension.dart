import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension OffsetExtension on Offset {
  Offset scaleWith(DimensionsHelper helper) {
    return Offset(
      helper.scaleWidthFrom(
        figmaWidth: dx,
      ),
      helper.scaleHeightFrom(
        figmaHeight: dy,
      ),
    );
  }
}
