import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveSize extends Responsive<Size> {
  const ResponsiveSize({
    required Size desktop,
    required Size mobile,
  }) : super(desktop, mobile);

  Size scaleWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return desktop.scaleWith(helper);
    }
    return mobile.scaleWith(helper);
  }
}
