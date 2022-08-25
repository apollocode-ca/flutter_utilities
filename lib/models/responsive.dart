import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';

abstract class Responsive<T> {
  final T desktop;
  final T mobile;

  const Responsive(
    this.desktop,
    this.mobile,
  );

  T getCurrentWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return desktop;
    }
    return mobile;
  }

  T scaleWith(
    DimensionsHelper helper, {
    T? max,
    T? maxDesktop,
    T? maxMobile,
    T? min,
    T? minDesktop,
    T? minMobile,
  }) {
    throw UnimplementedError(
      'The "scaleWith" method has not been implemented yet for the class '
      '"$runtimeType". Please override it in the class "$runtimeType" to be '
      'able to use it.',
    );
  }
}
