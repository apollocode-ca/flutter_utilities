import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';

class ResponsiveDouble extends Responsive<double> {
  const ResponsiveDouble({
    required double desktop,
    required double mobile,
  }) : super(desktop, mobile);

  @override
  double scaleWith(
    DimensionsHelper helper, {
    double? max,
    double? maxDesktop,
    double? maxMobile,
    double? min,
    double? minDesktop,
    double? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop;
    }
    return mobile;
  }
}
