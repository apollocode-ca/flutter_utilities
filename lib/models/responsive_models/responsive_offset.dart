import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveOffset extends Responsive<Offset> {
  const ResponsiveOffset({
    required Offset desktop,
    required Offset mobile,
  }) : super(desktop, mobile);

  @override
  Offset scaleWith(
    DimensionsHelper helper, {
    Offset? max,
    Offset? maxDesktop,
    Offset? maxMobile,
    Offset? min,
    Offset? minDesktop,
    Offset? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxOffset: maxDesktop ?? max,
        minOffset: minDesktop ?? min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxOffset: maxMobile ?? max,
      minOffset: minMobile ?? min,
    );
  }
}
