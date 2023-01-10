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

  /// The padding inside the heading of the table.
  ///
  /// By default, [padding] is used instead.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingPadding] value.
  final EdgeInsetsGeometry? headingPadding;

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
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.padding] value.
  ///
  /// If you rather want to apply padding on heading, rows and pagination
  /// separately, use [headingPadding], [rowPadding] and [paginationPadding].
  final EdgeInsetsGeometry? padding;

  /// The padding inside the pagination of the table.
  ///
  /// By default, [padding] is used instead.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.paginationPadding] value.
  ///
  /// If the table doesn't have pagination, this property doesn't have any
  /// effect.
  final EdgeInsetsGeometry? paginationPadding;

  /// The height of a data row in the table.
  ///
  /// By default, the value is 52.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.rowHeight] value.
  final double? rowHeight;

  /// The padding inside any row of the table.
  ///
  /// By default, [padding] is used instead.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.rowPadding] value.
  final EdgeInsetsGeometry? rowPadding;

  const MaterialScrollableTableDecoration({
    this.headingBackgroundColor,
    this.headingHeight,
    this.headingPadding,
    this.padding,
    this.paginationPadding,
    this.rowHeight,
    this.rowPadding,
  });
}
