import 'dart:math';

import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension BorderExtension on Border {
  double get maxWidth {
    final dimensions = [
      bottom.width,
      left.width,
      right.width,
      top.width,
    ];
    var maxWidth = dimensions.first;
    for (var dimension in dimensions.skip(1)) {
      maxWidth = max(maxWidth, dimension);
    }
    return maxWidth;
  }

  double get minWidth {
    final dimensions = [
      bottom.width,
      left.width,
      right.width,
      top.width,
    ];
    var minWidth = dimensions.first;
    for (var dimension in dimensions.skip(1)) {
      minWidth = min(minWidth, dimension);
    }
    return minWidth;
  }

  Border scaleWith(
    DimensionsHelper helper, {
    Border? maxBorder,
    Border? minBorder,
  }) {
    double? width;
    final isBottomSameThanTop = bottom.width == top.width;
    final isLeftSameThanTop = left.width == top.width;
    final isRightSameThanTop = right.width == top.width;
    if (isBottomSameThanTop && isLeftSameThanTop && isRightSameThanTop) {
      width = helper.scaleRadiusFrom(
        figmaRadius: top.width,
        maxRadius: maxBorder?.maxWidth,
        minRadius: minBorder?.minWidth,
      );
    }
    final bottomWidth = helper.scaleHeightFrom(
      figmaHeight: bottom.width,
      maxHeight: maxBorder?.bottom.width,
      minHeight: minBorder?.bottom.width,
    );
    final leftWidth = helper.scaleWidthFrom(
      figmaWidth: left.width,
      maxWidth: maxBorder?.left.width,
      minWidth: minBorder?.left.width,
    );
    final rightWidth = helper.scaleWidthFrom(
      figmaWidth: right.width,
      maxWidth: maxBorder?.right.width,
      minWidth: minBorder?.right.width,
    );
    final topWidth = helper.scaleHeightFrom(
      figmaHeight: top.width,
      maxHeight: maxBorder?.top.width,
      minHeight: minBorder?.top.width,
    );
    return Border(
      bottom: bottom.copyWith(
        width: width ?? bottomWidth,
      ),
      left: left.copyWith(
        width: width ?? leftWidth,
      ),
      right: right.copyWith(
        width: width ?? rightWidth,
      ),
      top: top.copyWith(
        width: width ?? topWidth,
      ),
    );
  }
}
