import 'package:flutter/material.dart';

mixin ColumnData on Enum {
  AlignmentGeometry? get alignment;
  TextAlign? get textAlign;
  double? get width;
}
