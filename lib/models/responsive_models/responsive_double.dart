import 'package:apollocode_flutter_utilities/models/responsive.dart';

class ResponsiveDouble extends Responsive<double> {
  const ResponsiveDouble({
    required double desktop,
    required double laptop,
    required double mobile,
  }) : super(desktop, laptop, mobile);
}
