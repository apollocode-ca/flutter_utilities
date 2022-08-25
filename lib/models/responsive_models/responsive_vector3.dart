import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:vector_math/vector_math_64.dart';

class ResponsiveVector3 extends Responsive<Vector3> {
  const ResponsiveVector3({
    required Vector3 desktop,
    required Vector3 mobile,
  }) : super(desktop, mobile);

  @override
  Vector3 scaleWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return desktop.scaleFrom(helper);
    }
    return mobile.scaleFrom(helper);
  }
}
