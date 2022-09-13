import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveEdgeInsets extends Responsive<EdgeInsets> {
  static const zero = ResponsiveEdgeInsets(
    desktop: EdgeInsets.zero,
    mobile: EdgeInsets.zero,
  );

  const ResponsiveEdgeInsets({
    required EdgeInsets desktop,
    required EdgeInsets mobile,
  }) : super(desktop, mobile);

  ResponsiveEdgeInsets operator +(ResponsiveEdgeInsets other) {
    return ResponsiveEdgeInsets(
      desktop: desktop + other.desktop,
      mobile: mobile + other.mobile,
    );
  }

  @override
  EdgeInsets scaleWith(
    DimensionsHelper helper, {
    EdgeInsets? max,
    EdgeInsets? maxDesktop,
    EdgeInsets? maxMobile,
    EdgeInsets? min,
    EdgeInsets? minDesktop,
    EdgeInsets? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxInsets: maxDesktop ?? max,
        minInsets: minDesktop ?? min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxInsets: maxMobile ?? max,
      minInsets: minMobile ?? min,
    );
  }
}
