import 'package:apollocode_flutter_utilities/models/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveBorder extends Responsive<Border> {
  const ResponsiveBorder({
    required Border desktop,
    required Border mobile,
  }) : super(desktop, mobile);
}
