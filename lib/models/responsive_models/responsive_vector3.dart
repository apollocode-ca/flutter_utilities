import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:vector_math/vector_math_64.dart';

class ResponsiveVector3 extends Responsive<Vector3> {
  ResponsiveVector3({
    Vector3? desktop,
    Vector3? mobile,
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
    final current = getCurrentWith(helper);
    final maxVector3 = helper.isDesktop ? maxDesktop : maxMobile ?? max;
    final minVector3 = helper.isMobile ? minDesktop : minMobile ?? min;
    return current.scaleWith(
      helper,
      maxVector3: maxVector3,
      minVector3: minVector3,
    );
  }
}
