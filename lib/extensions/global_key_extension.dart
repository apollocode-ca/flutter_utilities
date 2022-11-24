import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get widgetBounds {
    final renderObject = currentContext?.findRenderObject();
    final matrix = renderObject?.getTransformTo(null);
    final paintBounds = renderObject?.paintBounds;
    if (matrix != null && paintBounds != null) {
      final rect = MatrixUtils.transformRect(matrix, paintBounds);
      return rect;
    }
    return null;
  }
}
