import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:vector_math/vector_math_64.dart';

class ResponsiveVector3 extends Responsive<Vector3> {
  ResponsiveVector3({
    required Vector3 desktop,
    required Vector3 mobile,
  }) : super(desktop, mobile);

  @override
  Vector3 scaleWith(
    DimensionsHelper helper, {
    Vector3? max,
    Vector3? maxDesktop,
    Vector3? maxMobile,
    Vector3? min,
    Vector3? minDesktop,
    Vector3? minMobile,
  }) {
    if (helper.isDesktop) {
      return desktop.scaleFrom(
        helper,
        maxVector3: maxDesktop ?? max,
        minVector3: minDesktop ?? min,
      );
    }
    return mobile.scaleFrom(
      helper,
      maxVector3: maxMobile ?? max,
      minVector3: minMobile ?? min,
    );
  }
}
