import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveSize extends Responsive<Size> {
  const ResponsiveSize({
    Size? desktop,
    Size? mobile,
  }) : super(desktop, mobile);

  @override
  Size scaleWith(
    DimensionsHelper helper, {
    Size? max,
    Size? maxDesktop,
    Size? maxMobile,
    Size? min,
    Size? minDesktop,
    Size? minMobile,
  }) {
    final current = getCurrentWith(helper);
    final maxSize = helper.isDesktop ? maxDesktop : maxMobile ?? max;
    final minSize = helper.isDesktop ? minDesktop : minMobile ?? min;
    return current.scaleWith(
      helper,
      maxSize: maxSize,
      minSize: minSize,
    );
  }
}
