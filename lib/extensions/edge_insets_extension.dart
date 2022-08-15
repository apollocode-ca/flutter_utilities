import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets scaleWith(DimensionsHelper helper) {
    return EdgeInsets.only(
      bottom: helper.scaleHeightFrom(
        figmaHeight: bottom,
      ),
      left: helper.scaleWidthFrom(
        figmaWidth: left,
      ),
      right: helper.scaleWidthFrom(
        figmaWidth: right,
      ),
      top: helper.scaleHeightFrom(
        figmaHeight: top,
      ),
    );
  }
}
