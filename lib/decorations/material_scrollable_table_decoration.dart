import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:flutter/material.dart';

/// Decoration for the [MaterialScrollableTable].
///
/// The values defined with the decoration will override the values defined in
/// the [MaterialScrollableTableThemeData].
class MaterialScrollableTableDecoration {
  /// The alignment of the cells of the checkbox column of the table.
  ///
  /// By default, the value is [AlignmentDirectional.center].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.checkboxColumnAlignment] value.
  final AlignmentGeometry? checkboxColumnAlignment;

  /// The width of the checkboxes column of the table.
  ///
  /// By default, the value is 48.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.checkboxColumnWidth] value.
  final double? checkboxColumnWidth;

  /// The margin between each column of the table.
  ///
  /// By default, the value is 32.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.columnSpacing] value.
  final double? columnSpacing;

  /// The background color of any even row of the table.
  ///
  /// By default, the value is [ColorScheme.surface].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.evenRowBackgroundColor] value.
  final Color? evenRowBackgroundColor;

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

  /// The style of the texts in the heading of the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// TextStyle(
  ///   color: colorScheme.onPrimary,
  ///   fontWeight: FontWeight.w500,
  /// );
  /// ```
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingTextStyle] value.
  final TextStyle? headingTextStyle;

  /// The background color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.surfaceVariant].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.oddRowBackgroundColor] value.
  final Color? oddRowBackgroundColor;

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
    this.checkboxColumnAlignment,
    this.checkboxColumnWidth,
    this.columnSpacing,
    this.evenRowBackgroundColor,
    this.headingBackgroundColor,
    this.headingHeight,
    this.headingPadding,
    this.headingTextStyle,
    this.oddRowBackgroundColor,
    this.padding,
    this.paginationPadding,
    this.rowHeight,
    this.rowPadding,
  });
}
