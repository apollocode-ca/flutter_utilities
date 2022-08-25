import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveSize extends Responsive<Size> {
  const ResponsiveSize({
    required Size desktop,
    required Size mobile,
  }) : super(desktop, mobile);

  @override
  Size scaleWith(
    DimensionsHelper helper, {
    Size? max,
    Size? min,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxSize: max,
        minSize: min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxSize: max,
      minSize: min,
    );
  }
}
