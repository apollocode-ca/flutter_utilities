import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';

abstract class Responsive<T> {
  final T desktop;
  final T mobile;

  const Responsive(
    this.desktop,
    this.mobile,
  );

  T scaleWith(DimensionsHelper helper);
}
