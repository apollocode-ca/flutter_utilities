import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveOffset extends Responsive<Offset> {
  const ResponsiveOffset({
    required Offset desktop,
    required Offset laptop,
    required Offset mobile,
  }) : super(desktop, laptop, mobile);

  @override
  Offset scaleWith(
    DimensionsHelper helper, {
    Offset? max,
    Offset? maxDesktop,
    Offset? maxLaptop,
    Offset? maxMobile,
    Offset? min,
    Offset? minDesktop,
    Offset? minLaptop,
    Offset? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxOffset: maxDesktop ?? max,
        minOffset: minDesktop ?? min,
      );
    }
    if (helper.isLaptop) {
      return laptop.scaleWith(
        helper,
        maxOffset: maxLaptop ?? max,
        minOffset: minLaptop ?? min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxOffset: maxMobile ?? max,
      minOffset: minMobile ?? min,
    );
  }
}
