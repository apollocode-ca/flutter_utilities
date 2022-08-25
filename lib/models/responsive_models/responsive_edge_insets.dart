import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveEdgeInsets extends Responsive<EdgeInsets> {
  const ResponsiveEdgeInsets({
    required EdgeInsets desktop,
    required EdgeInsets mobile,
  }) : super(desktop, mobile);

  @override
  EdgeInsets scaleWith(
    DimensionsHelper helper, {
    EdgeInsets? max,
    EdgeInsets? min,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxInsets: max,
        minInsets: min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxInsets: max,
      minInsets: min,
    );
  }
}
