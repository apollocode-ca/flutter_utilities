import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveBorder extends Responsive<Border> {
  ResponsiveBorder({
    required Border desktop,
    required Border laptop,
    required Border mobile,
  }) : super(desktop, laptop, mobile);

  @override
  Border scaleWith(
    DimensionsHelper helper, {
    Border? max,
    Border? maxDesktop,
    Border? maxLaptop,
    Border? maxMobile,
    Border? min,
    Border? minDesktop,
    Border? minLaptop,
    Border? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleWith(
        helper,
        maxBorder: maxDesktop ?? max,
        minBorder: minDesktop ?? min,
      );
    }
    if (helper.isLaptop) {
      return laptop.scaleWith(
        helper,
        maxBorder: maxLaptop ?? max,
        minBorder: minLaptop ?? min,
      );
    }
    return mobile.scaleWith(
      helper,
      maxBorder: maxMobile ?? max,
      minBorder: minMobile ?? min,
    );
  }
}
