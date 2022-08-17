import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:vector_math/vector_math_64.dart';

extension Vector3Extension on Vector3 {
  Vector3 scaleFrom(DimensionsHelper helper) {
    return Vector3(
      helper.scaleWidthFrom(
        figmaWidth: x,
      ),
      helper.scaleHeightFrom(
        figmaHeight: y,
      ),
      z,
    );
  }
}
