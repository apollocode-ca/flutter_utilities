import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:flutter/material.dart';

/// Decoration for the [MaterialScrollableTable].
///
/// The values defined with the decoration will override the values defined in
/// the [MaterialScrollableTableThemeData].
class MaterialScrollableTableDecoration {
  /// The background color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.primary].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingBackgroundColor] value.
  final Color? headingBackgroundColor;

  /// The height of the heading of the table.
  ///
  /// By default, the value is 56.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingHeight] value.
  final double? headingHeight;

  /// The height of a data row in the table.
  ///
  /// By default, the value is 52.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.rowHeight] value.
  final double? rowHeight;

  const MaterialScrollableTableDecoration({
    this.headingBackgroundColor,
    this.headingHeight,
    this.rowHeight,
  });
}
