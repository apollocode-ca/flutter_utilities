import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveSize extends Responsive<Size> {
  const ResponsiveSize({
    required Size desktop,
    required Size laptop,
    required Size mobile,
  }) : super(desktop, laptop, mobile);

  @override
  Size scaleWith(
    DimensionsHelper helper, {
    Size? max,
    Size? maxDesktop,
    Size? maxLaptop,
    Size? maxMobile,
    Size? min,
    Size? minDesktop,
    Size? minLaptop,
    Size? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxSize: maxDesktop ?? max,
        minSize: minDesktop ?? min,
      );
    }
    if (helper.isLaptop) {
      return laptop.scaleWith(
        helper,
        maxSize: maxLaptop ?? max,
        minSize: minLaptop ?? min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxSize: maxMobile ?? max,
      minSize: minMobile ?? min,
    );
  }
}
