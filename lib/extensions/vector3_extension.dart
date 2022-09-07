import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:vector_math/vector_math_64.dart';

extension Vector3Extension on Vector3 {
  Vector3 scaleWith(
    DimensionsHelper helper, {
    Vector3? maxVector3,
    Vector3? minVector3,
  }) {
    return Vector3(
      helper.scaleWidthFrom(
        figmaWidth: x,
        maxWidth: maxVector3?.x,
        minWidth: minVector3?.x,
      ),
      helper.scaleHeightFrom(
        figmaHeight: y,
        maxHeight: maxVector3?.y,
        minHeight: minVector3?.y,
      ),
      z.clamp(
        _getZLowerClampLimit(minVector3),
        _getZUpperClampLimit(maxVector3),
      ),
    );
  }

  double _getZLowerClampLimit(Vector3? min) {
    if (min != null) {
      return min.z;
    }
    return double.negativeInfinity;
  }

  double _getZUpperClampLimit(Vector3? max) {
    if (max != null) {
      return max.z;
    }
    return double.infinity;
  }
}
