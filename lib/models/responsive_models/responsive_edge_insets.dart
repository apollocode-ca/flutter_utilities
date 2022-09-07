import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveEdgeInsets extends Responsive<EdgeInsets> {
  static const zero = ResponsiveEdgeInsets(
    desktop: EdgeInsets.zero,
    mobile: EdgeInsets.zero,
  );

  const ResponsiveEdgeInsets({
    EdgeInsets? desktop,
    EdgeInsets? mobile,
  }) : super(desktop, mobile);

  ResponsiveEdgeInsets operator +(ResponsiveEdgeInsets other) {
    return ResponsiveEdgeInsets(
      desktop: _add(desktop, other.desktop),
      mobile: _add(mobile, other.mobile),
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
    final current = getCurrentWith(helper);
    final maxInsets = helper.isDesktop ? maxDesktop : maxMobile ?? max;
    final minInsets = helper.isDesktop ? minDesktop : minMobile ?? min;
    return current.scaleWith(
      helper,
      maxInsets: maxInsets,
      minInsets: minInsets,
    );
  }

  EdgeInsets? _add(EdgeInsets? first, EdgeInsets? second) {
    if (first == null && second == null) {
      return null;
    }
    if (first == null) {
      return second;
    }
    if (second == null) {
      return first;
    }
    return first + second;
  }
}
