import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveOffset extends Responsive<Offset> {
  const ResponsiveOffset({
    Offset? desktop,
    Offset? mobile,
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
    final current = getCurrentWith(helper);
    final maxOffset = helper.isDesktop ? maxDesktop : maxMobile ?? max;
    final minOffset = helper.isDesktop ? minDesktop : minMobile ?? min;
    return current.scaleWith(
      helper,
      maxOffset: maxOffset,
      minOffset: minOffset,
    );
  }
}
