import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveEdgeInsets extends Responsive<EdgeInsets> {
  const ResponsiveEdgeInsets({
    required EdgeInsets desktop,
    required EdgeInsets mobile,
  }) : super(desktop, mobile);

  @override
  EdgeInsets scaleWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return desktop.scaleWith(helper);
    }
    return mobile.scaleWith(helper);
  }
}
