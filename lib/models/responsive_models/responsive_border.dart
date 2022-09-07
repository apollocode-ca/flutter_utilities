import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveBorder extends Responsive<Border> {
  ResponsiveBorder({
    Border? desktop,
    Border? mobile,
  }) : super(desktop, mobile);

  @override
  Border scaleWith(
    DimensionsHelper helper, {
    Border? max,
    Border? maxDesktop,
    Border? maxMobile,
    Border? min,
    Border? minDesktop,
    Border? minMobile,
  }) {
    final current = getCurrentWith(helper);
    final maxBorder = helper.isDesktop ? maxDesktop : maxMobile ?? max;
    final minBorder = helper.isDesktop ? minDesktop : minMobile ?? min;
    return current.scaleWith(
      helper,
      maxBorder: maxBorder,
      minBorder: minBorder,
    );
  }
}
