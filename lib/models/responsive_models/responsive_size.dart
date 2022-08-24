import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveSize extends Responsive<Size> {
  const ResponsiveSize({
    required Size desktop,
    required Size mobile,
  }) : super(desktop, mobile);
}
