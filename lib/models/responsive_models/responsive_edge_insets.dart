import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveEdgeInsets extends Responsive<EdgeInsets> {
  ResponsiveEdgeInsets({
    required EdgeInsets desktop,
    required EdgeInsets mobile,
  }) : super(desktop, mobile);
}
