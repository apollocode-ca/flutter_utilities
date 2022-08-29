import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

extension BorderExtension on Border {
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
        maxRadius: maxBorder?.top.width,
        minRadius: minBorder?.top.width,
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
