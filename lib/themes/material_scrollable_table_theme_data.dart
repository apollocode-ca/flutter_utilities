import 'dart:ui';

import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:flutter/material.dart';

/// Theme data for the [MaterialScrollableTable].
///
/// The values defined here will be overriden by any
/// [MaterialScrollableTableDecoration] provided to the table.
class MaterialScrollableTableThemeData
    extends ThemeExtension<MaterialScrollableTableThemeData> {
  /// The width of the checkboxes column of the table.
  ///
  /// By default, the value is 48.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.checkboxColumnWidth] value when non
  /// null.
  final double checkboxColumnWidth;

  /// The background color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.primary].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingBackgroundColor] value when non
  /// null.
  final Color? headingBackgroundColor;

  /// The height of the heading of the table.
  ///
  /// By default, the value is 56.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingHeight] value when non null.
  final double headingHeight;

  /// The padding inside each row (including the heading and the pagination
  /// rows) of the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const EdgeInsets.symmetric(
  ///   horizontal: 24,
  /// );
  /// ```
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.padding] value when non null.
  final EdgeInsetsGeometry padding;

  /// The height of a data row in the table.
  ///
  /// By default, the value is 52.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.rowHeight] value when non null.
  final double rowHeight;

  MaterialScrollableTableThemeData({
    required this.checkboxColumnWidth,
    this.headingBackgroundColor,
    required this.headingHeight,
    required this.padding,
    required this.rowHeight,
  });

  @override
  MaterialScrollableTableThemeData copyWith({
    final double? checkboxColumnWidth,
    final Color? headingBackgroundColor,
    final double? headingHeight,
    final EdgeInsetsGeometry? padding,
    final double? rowHeight,
  }) {
    return MaterialScrollableTableThemeData(
      checkboxColumnWidth: checkboxColumnWidth ?? this.checkboxColumnWidth,
      headingBackgroundColor:
          headingBackgroundColor ?? this.headingBackgroundColor,
      headingHeight: headingHeight ?? this.headingHeight,
      padding: padding ?? this.padding,
      rowHeight: rowHeight ?? this.rowHeight,
    );
  }

  @override
  MaterialScrollableTableThemeData lerp(
    ThemeExtension<MaterialScrollableTableThemeData>? other,
    double t,
  ) {
    if (other is! MaterialScrollableTableThemeData) {
      return this;
    }
    return MaterialScrollableTableThemeData(
      checkboxColumnWidth:
          lerpDouble(checkboxColumnWidth, other.checkboxColumnWidth, t) ??
              checkboxColumnWidth,
      headingBackgroundColor:
          Color.lerp(headingBackgroundColor, other.headingBackgroundColor, t) ??
              headingBackgroundColor,
      headingHeight:
          lerpDouble(headingHeight, other.headingHeight, t) ?? headingHeight,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
      rowHeight: lerpDouble(rowHeight, other.rowHeight, t) ?? rowHeight,
    );
  }
}
