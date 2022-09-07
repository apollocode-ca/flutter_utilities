import 'package:apollocode_flutter_utilities/errors/responsive_error.dart';
import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';

abstract class Responsive<T> {
  final T? desktop;
  final T? mobile;

  const Responsive(
    this.desktop,
    this.mobile,
  );

  T getCurrentWith(DimensionsHelper helper) {
    if (helper.isDesktop) {
      return _getDesktop();
    }
    return _getMobile();
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

  T _getDesktop() {
    final desktop = this.desktop;
    if (desktop != null) {
      return desktop;
    }
    throw ResponsiveError.noDesktop();
  }

  T _getMobile() {
    final mobile = this.mobile;
    if (mobile != null) {
      return mobile;
    }
    throw ResponsiveError.noMobile();
  }
}
