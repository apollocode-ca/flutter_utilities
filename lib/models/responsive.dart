import 'package:apollocode_flutter_utilities/errors/responsive_error.dart';
import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';

abstract class Responsive<T> {
  final T desktop;
  final T laptop;
  final T mobile;

  const Responsive(
    this.desktop,
    this.laptop,
    this.mobile,
  );

  T getCurrentWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return desktop;
    }
    if (helper.isLaptop) {
      return laptop;
    }
    return mobile;
  }

  T scaleWith(
    DimensionsHelper helper, {
    T? max,
    T? maxDesktop,
    T? maxLaptop,
    T? maxMobile,
    T? min,
    T? minDesktop,
    T? minLaptop,
    T? minMobile,
  }) {
    throw UnimplementedError(
      'The "scaleWith" method has not been implemented yet for the class '
      '"$runtimeType". Please override it in the class "$runtimeType" to be '
      'able to use it.',
    );
  }
}
