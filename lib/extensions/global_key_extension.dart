import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Offset? get absolutePosition {
    final renderObject = currentContext?.findRenderObject();
    final matrix = renderObject?.getTransformTo(null);
    final paintBounds = renderObject?.paintBounds;
    if (matrix != null && paintBounds != null) {
      final rect = MatrixUtils.transformRect(matrix, paintBounds);
      return rect.topLeft;
    }
    return null;
  }
}
