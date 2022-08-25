import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveTextStyle extends Responsive<TextStyle> {
  const ResponsiveTextStyle({
    required TextStyle desktop,
    required TextStyle mobile,
  }) : super(desktop, mobile);
}
