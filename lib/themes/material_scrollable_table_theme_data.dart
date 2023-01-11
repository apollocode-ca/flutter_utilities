import 'dart:ui';

import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Theme data for the [MaterialScrollableTable].
///
/// The values defined here will be overriden by any
/// [MaterialScrollableTableDecoration] provided to the table.
class MaterialScrollableTableThemeData
    extends ThemeExtension<MaterialScrollableTableThemeData> {
  /// The duration of overlay animations on any row of the table.
  ///
  /// By default, the value is [kThemeAnimationDuration].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.animationDuration] value when non null.
  final Duration animationDuration;

  /// The alignment of the cells of the checkbox column of the table.
  ///
  /// By default, the value is [AlignmentDirectional.center].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.checkboxColumnAlignment] value when non
  /// null.
  final AlignmentGeometry checkboxColumnAlignment;

  /// The width of the checkbox column of the table.
  ///
  /// By default, the value is 48.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.checkboxColumnWidth] value when non
  /// null.
  final double checkboxColumnWidth;

  /// The margin between each column of the table.
  ///
  /// By default, the value is 32.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.columnSpacing] value when non null.
  final double columnSpacing;

  /// The background color of any even row of the table.
  ///
  /// By default, the value is [ColorScheme.surface].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.evenRowBackgroundColor] value when non
  /// null.
  final Color? evenRowBackgroundColor;

  /// The foreground color of any even row of the table.
  ///
  /// By default, the value is [ColorScheme.onSurface].
  ///
  /// This color is used by default for every text in the row. The foreground
  /// color is also used for the overlay color of the row animations.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.evenRowForegroundColor] value when non
  /// null.
  final Color? evenRowForegroundColor;

  /// The background color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.primary].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingBackgroundColor] value when non
  /// null.
  final Color? headingBackgroundColor;

  /// The foreground color of the heading of the table.
  ///
  /// By default, the value is [ColorScheme.onPrimary].
  ///
  /// This color is used by default for every text in the heading.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingForegroundColor] value when non
  /// null.
  final Color? headingForegroundColor;

  /// The height of the heading of the table.
  ///
  /// By default, the value is 56.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingHeight] value when non null.
  final double headingHeight;

  /// The style of the texts in the heading of the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle(
  ///   fontWeight: FontWeight.w500,
  /// );
  /// ```
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingTextStyle] value when non null.
  final TextStyle headingTextStyle;

  /// The alignment of the loading indicator of the table.
  ///
  /// By default, the value is [AlignmentDirectional.centerEnd].
  ///
  /// The loading indicator is the one that shows up above the table after the
  /// first data loading.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.loadingIndicatorAlignment] value when
  /// non null.
  final AlignmentGeometry loadingIndicatorAlignment;

  /// The height of loading indicator of the table.
  ///
  /// By default, the value is 32.
  ///
  /// The loading indicator is the one that shows up above the table after the
  /// first data loading.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.loadingIndicatorHeight] value when non
  /// null.
  final double loadingIndicatorHeight;

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
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.loadingIndicatorMargin] value when non
  /// null.
  final EdgeInsetsGeometry loadingIndicatorMargin;

  /// The color of the loading widget of the table.
  ///
  /// By default, the value is [ColorScheme.onSurfaceVariant].
  ///
  /// The loading widget is the one that shows up on the first data loading.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.loadingWidgetColor] value when non
  /// null.
  ///
  /// This field is useless if you replaced the default loading widget by a
  /// custom one.
  final Color? loadingWidgetColor;

  /// The background color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.surfaceVariant].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.evenRowBackgroundColor] value when non
  /// null.
  final Color? oddRowBackgroundColor;

  /// The foreground color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.onSurfaceVariant].
  ///
  /// This color is used by default for every text in the row. The foreground
  /// color is also used for the overlay color of the row animations.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.oddRowForegroundColor] value when non
  /// null.
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

  /// The style of the texts inside a data row in the table.
  ///
  /// By default, the value is:
  ///
  /// ```dart
  /// const TextStyle();
  /// ```
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.rowTextStyle] value when non null.
  final TextStyle rowTextStyle;

  MaterialScrollableTableThemeData({
    required this.animationDuration,
    required this.checkboxColumnAlignment,
    required this.checkboxColumnWidth,
    required this.columnSpacing,
    this.evenRowBackgroundColor,
    this.evenRowForegroundColor,
    this.headingBackgroundColor,
    this.headingForegroundColor,
    required this.headingHeight,
    required this.headingTextStyle,
    required this.loadingIndicatorAlignment,
    required this.loadingIndicatorHeight,
    required this.loadingIndicatorMargin,
    this.loadingWidgetColor,
    this.oddRowBackgroundColor,
    this.oddRowForegroundColor,
    required this.padding,
    required this.rowHeight,
    required this.rowTextStyle,
  });

  @override
  MaterialScrollableTableThemeData copyWith({
    final Duration? animationDuration,
    final AlignmentGeometry? checkboxColumnAlignment,
    final double? checkboxColumnWidth,
    final double? columnSpacing,
    final Color? evenRowBackgroundColor,
    final evenRowForegroundColor,
    final Color? headingBackgroundColor,
    final Color? headingForegroundColor,
    final double? headingHeight,
    final TextStyle? headingTextStyle,
    final AlignmentGeometry? loadingIndicatorAlignment,
    final double? loadingIndicatorHeight,
    final EdgeInsetsGeometry? loadingIndicatorMargin,
    final Color? loadingWidgetColor,
    final Color? oddRowBackgroundColor,
    final Color? oddRowForegroundColor,
    final EdgeInsetsGeometry? padding,
    final double? rowHeight,
    final TextStyle? rowTextStyle,
  }) {
    return MaterialScrollableTableThemeData(
      animationDuration: animationDuration ?? this.animationDuration,
      checkboxColumnAlignment:
          checkboxColumnAlignment ?? this.checkboxColumnAlignment,
      checkboxColumnWidth: checkboxColumnWidth ?? this.checkboxColumnWidth,
      columnSpacing: columnSpacing ?? this.columnSpacing,
      evenRowBackgroundColor:
          evenRowBackgroundColor ?? this.evenRowBackgroundColor,
      evenRowForegroundColor:
          evenRowForegroundColor ?? this.evenRowForegroundColor,
      headingBackgroundColor:
          headingBackgroundColor ?? this.headingBackgroundColor,
      headingForegroundColor:
          headingForegroundColor ?? this.headingForegroundColor,
      headingHeight: headingHeight ?? this.headingHeight,
      headingTextStyle: headingTextStyle ?? this.headingTextStyle,
      loadingIndicatorAlignment:
          loadingIndicatorAlignment ?? this.loadingIndicatorAlignment,
      loadingIndicatorHeight:
          loadingIndicatorHeight ?? this.loadingIndicatorHeight,
      loadingIndicatorMargin:
          loadingIndicatorMargin ?? this.loadingIndicatorMargin,
      loadingWidgetColor: loadingWidgetColor ?? this.loadingWidgetColor,
      oddRowBackgroundColor:
          oddRowBackgroundColor ?? this.oddRowBackgroundColor,
      oddRowForegroundColor:
          oddRowForegroundColor ?? this.oddRowForegroundColor,
      padding: padding ?? this.padding,
      rowHeight: rowHeight ?? this.rowHeight,
      rowTextStyle: rowTextStyle ?? this.rowTextStyle,
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
      animationDuration:
          lerpDuration(animationDuration, other.animationDuration, t),
      checkboxColumnAlignment:
          lerpCheckboxColumnAlignment(other, t) ?? checkboxColumnAlignment,
      checkboxColumnWidth:
          lerpDouble(checkboxColumnWidth, other.checkboxColumnWidth, t) ??
              checkboxColumnWidth,
      columnSpacing:
          lerpDouble(columnSpacing, other.columnSpacing, t) ?? columnSpacing,
      evenRowBackgroundColor:
          Color.lerp(evenRowBackgroundColor, other.evenRowBackgroundColor, t) ??
              evenRowBackgroundColor,
      evenRowForegroundColor:
          Color.lerp(evenRowForegroundColor, other.evenRowForegroundColor, t) ??
              evenRowForegroundColor,
      headingBackgroundColor:
          Color.lerp(headingBackgroundColor, other.headingBackgroundColor, t) ??
              headingBackgroundColor,
      headingForegroundColor:
          Color.lerp(headingForegroundColor, other.headingForegroundColor, t) ??
              headingForegroundColor,
      headingHeight:
          lerpDouble(headingHeight, other.headingHeight, t) ?? headingHeight,
      headingTextStyle:
          TextStyle.lerp(headingTextStyle, other.headingTextStyle, t) ??
              headingTextStyle,
      loadingIndicatorAlignment:
          lerpLoadingIndicatorAlignment(other, t) ?? loadingIndicatorAlignment,
      loadingIndicatorHeight:
          lerpDouble(loadingIndicatorHeight, other.loadingIndicatorHeight, t) ??
              loadingIndicatorHeight,
      loadingIndicatorMargin:
          lerpLoadingIndicatorMargin(other, t) ?? loadingIndicatorMargin,
      loadingWidgetColor:
          Color.lerp(loadingWidgetColor, other.loadingWidgetColor, t) ??
              loadingWidgetColor,
      oddRowBackgroundColor:
          Color.lerp(oddRowBackgroundColor, other.oddRowBackgroundColor, t) ??
              oddRowBackgroundColor,
      oddRowForegroundColor:
          Color.lerp(oddRowBackgroundColor, other.oddRowForegroundColor, t) ??
              oddRowForegroundColor,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
      rowHeight: lerpDouble(rowHeight, other.rowHeight, t) ?? rowHeight,
      rowTextStyle:
          TextStyle.lerp(rowTextStyle, other.rowTextStyle, t) ?? rowTextStyle,
    );
  }

  AlignmentGeometry? lerpCheckboxColumnAlignment(
    MaterialScrollableTableThemeData other,
    double t,
  ) {
    return AlignmentGeometry.lerp(
      checkboxColumnAlignment,
      other.checkboxColumnAlignment,
      t,
    );
  }

  AlignmentGeometry? lerpLoadingIndicatorAlignment(
    MaterialScrollableTableThemeData other,
    double t,
  ) {
    return AlignmentGeometry.lerp(
      loadingIndicatorAlignment,
      other.loadingIndicatorAlignment,
      t,
    );
  }

  EdgeInsetsGeometry? lerpLoadingIndicatorMargin(
    MaterialScrollableTableThemeData other,
    double t,
  ) {
    return EdgeInsetsGeometry.lerp(
      loadingIndicatorMargin,
      other.loadingIndicatorMargin,
      t,
    );
  }
}
