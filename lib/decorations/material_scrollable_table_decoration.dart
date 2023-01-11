import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:flutter/material.dart';

/// Decoration for the [MaterialScrollableTable].
///
/// The values defined with the decoration will override the values defined in
/// the [MaterialScrollableTableThemeData].
class MaterialScrollableTableDecoration {
  /// The duration of overlay animations on any row of the table.
  ///
  /// By default, the value is [kThemeAnimationDuration].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.animationDuration] value.
  final Duration? animationDuration;

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

  /// The style of the text displayed when the table is empty.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle();
  /// ```
  ///
  /// When this field is null, the value of [oddRowTextStyle] will be taken.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.emptyTableTextStyle] value.
  final TextStyle? emptyTableTextStyle;

  /// The background color of any even row of the table.
  ///
  /// By default, the value is [ColorScheme.surface].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.evenRowBackgroundColor] value.
  final Color? evenRowBackgroundColor;

  /// The foreground color of any even row of the table.
  ///
  /// By default, the value is [ColorScheme.onSurface].
  ///
  /// This color is used by default for every text in the row. To override the
  /// text color, use the [TextStyle.color] field of [evenRowTextStyle]. The
  /// foreground color is also used for the overlay color of the row animations.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.evenRowForegroundColor] value.
  final Color? evenRowForegroundColor;

  /// The style of the texts inside an even row in the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle();
  /// ```
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableDecoration.rowTextStyle] value.
  final TextStyle? evenRowTextStyle;

  /// The background color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.primary].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingBackgroundColor] value.
  final Color? headingBackgroundColor;

  /// The foreground color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.onPrimary]. To override the text
  /// color, use the [TextStyle.color] field of [evenRowTextStyle].
  ///
  /// This color is used by default for every text in the heading.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.headingForegroundColor] value.
  final Color? headingForegroundColor;

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

  /// The alignment of the loading indicator of the table.
  ///
  /// By default, the value is [AlignmentDirectional.centerEnd].
  ///
  /// The loading indicator is the one that shows up above the table after the
  /// first data loading.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.loadingIndicatorAlignment] value.
  final AlignmentGeometry? loadingIndicatorAlignment;

  /// The height of the space taken by the loading indicator of the table.
  ///
  /// By default, the value is 32.
  ///
  /// The loading indicator is the one that shows up above the table after the
  /// first data loading.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.loadingIndicatorHeight] value.
  final double? loadingIndicatorHeight;

  /// The margin around the loading indicator of the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const EdgeInsetsDirectional.only(
  ///   bottom: 4,
  ///   end: 24,
  /// );
  /// ```
  ///
  /// The loading indicator is the one that shows up above the table after the
  /// first data loading.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.loadingIndicatorMargin] value.
  final EdgeInsetsGeometry? loadingIndicatorMargin;

  /// The color of the primary loading widget of the table.
  ///
  /// By default, the value is [ColorScheme.onSurfaceVariant].
  ///
  /// The primary loading widget is the one that shows up on the first data
  /// loading.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.loadingWidgetColor] value.
  ///
  /// This field is useless if you replaced the default loading widget by a
  /// custom one.
  final Color? loadingWidgetColor;

  /// The background color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.surfaceVariant].
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.oddRowBackgroundColor] value.
  final Color? oddRowBackgroundColor;

  /// The style of the texts inside an odd row in the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle();
  /// ```
  ///
  /// If this value is null, the value of [rowTextStyle] will be taken.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableDecoration.rowTextStyle] value.
  final TextStyle? oddRowTextStyle;

  /// The foreground color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.onSurfaceVariant].
  ///
  /// This color is used by default for every text in the row. To override the
  /// text color, use the [TextStyle.color] field of [oddRowTextStyle]. The
  /// foreground color is also used for the overlay color of the row animations.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.oddRowForegroundColor] value.
  final Color? oddRowForegroundColor;

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

  /// The height of the pagination row of the table.
  ///
  /// By default, [headingHeight] is used instead.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.paginationHeight] value.
  ///
  /// If the table doesn't have pagination, this property doesn't have any
  /// effect.
  final double? paginationHeight;

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

  /// The style of the texts inside a row in the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle();
  /// ```
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.rowTextStyle] value.
  final TextStyle? rowTextStyle;

  const MaterialScrollableTableDecoration({
    this.animationDuration,
    this.checkboxColumnAlignment,
    this.checkboxColumnWidth,
    this.columnSpacing,
    this.emptyTableTextStyle,
    this.evenRowBackgroundColor,
    this.evenRowForegroundColor,
    this.evenRowTextStyle,
    this.headingBackgroundColor,
    this.headingForegroundColor,
    this.headingHeight,
    this.headingPadding,
    this.headingTextStyle,
    this.loadingIndicatorAlignment,
    this.loadingIndicatorHeight,
    this.loadingIndicatorMargin,
    this.loadingWidgetColor,
    this.oddRowBackgroundColor,
    this.oddRowForegroundColor,
    this.oddRowTextStyle,
    this.padding,
    this.paginationHeight,
    this.paginationPadding,
    this.rowHeight,
    this.rowPadding,
    this.rowTextStyle,
  });
}
