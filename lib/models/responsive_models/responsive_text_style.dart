import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveTextStyle extends Responsive<TextStyle> {
  const ResponsiveTextStyle({
    required TextStyle desktop,
    required TextStyle mobile,
  }) : super(desktop, mobile);

  @override
  TextStyle scaleWith(
    DimensionsHelper helper, {
    TextStyle? max,
    TextStyle? maxDesktop,
    TextStyle? maxMobile,
    TextStyle? min,
    TextStyle? minDesktop,
    TextStyle? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop;
    }
    return mobile;
  }
}
