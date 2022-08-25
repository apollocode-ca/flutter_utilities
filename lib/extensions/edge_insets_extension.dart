import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets scaleWith(
    DimensionsHelper helper, {
    EdgeInsets? maxInsets,
    EdgeInsets? minInsets,
  }) {
    return EdgeInsets.only(
      bottom: helper.scaleHeightFrom(
        figmaHeight: bottom,
        maxHeight: maxInsets?.bottom,
        minHeight: minInsets?.bottom,
      ),
      left: helper.scaleWidthFrom(
        figmaWidth: left,
        maxWidth: maxInsets?.left,
        minWidth: minInsets?.left,
      ),
      right: helper.scaleWidthFrom(
        figmaWidth: right,
        maxWidth: maxInsets?.right,
        minWidth: minInsets?.right,
      ),
      top: helper.scaleHeightFrom(
        figmaHeight: top,
        maxHeight: maxInsets?.top,
        minHeight: minInsets?.top,
      ),
    );
  }
}
