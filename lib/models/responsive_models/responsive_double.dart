import 'package:apollocode_flutter_utilities/models/responsive.dart';

class ResponsiveDouble extends Responsive<double> {
  const ResponsiveDouble({
    required double desktop,
    required double mobile,
  }) : super(desktop, mobile);
}
