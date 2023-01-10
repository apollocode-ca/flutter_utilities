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
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingTextStyle] value when non null.
  final TextStyle? headingTextStyle;

  /// The background color of any odd row of the table.
  ///
  /// By default, the value is [ColorScheme.surfaceVariant].
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.evenRowBackgroundColor] value when non
  /// null.
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
    required this.animationDuration,
    required this.checkboxColumnAlignment,
    required this.checkboxColumnWidth,
    required this.columnSpacing,
    this.evenRowBackgroundColor,
    this.headingBackgroundColor,
    required this.headingHeight,
    this.headingTextStyle,
    this.oddRowBackgroundColor,
    required this.padding,
    required this.rowHeight,
  });

  @override
  MaterialScrollableTableThemeData copyWith({
    final Duration? animationDuration,
    final AlignmentGeometry? checkboxColumnAlignment,
    final double? checkboxColumnWidth,
    final double? columnSpacing,
    final Color? evenRowBackgroundColor,
    final Color? headingBackgroundColor,
    final double? headingHeight,
    final TextStyle? headingTextStyle,
    final Color? oddRowBackgroundColor,
    final EdgeInsetsGeometry? padding,
    final double? rowHeight,
  }) {
    return MaterialScrollableTableThemeData(
      animationDuration: animationDuration ?? this.animationDuration,
      checkboxColumnAlignment:
          checkboxColumnAlignment ?? this.checkboxColumnAlignment,
      checkboxColumnWidth: checkboxColumnWidth ?? this.checkboxColumnWidth,
      columnSpacing: columnSpacing ?? this.columnSpacing,
      evenRowBackgroundColor:
          evenRowBackgroundColor ?? this.evenRowBackgroundColor,
      headingBackgroundColor:
          headingBackgroundColor ?? this.headingBackgroundColor,
      headingHeight: headingHeight ?? this.headingHeight,
      headingTextStyle: headingTextStyle ?? this.headingTextStyle,
      oddRowBackgroundColor:
          oddRowBackgroundColor ?? this.oddRowBackgroundColor,
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
      headingBackgroundColor:
          Color.lerp(headingBackgroundColor, other.headingBackgroundColor, t) ??
              headingBackgroundColor,
      headingHeight:
          lerpDouble(headingHeight, other.headingHeight, t) ?? headingHeight,
      headingTextStyle:
          TextStyle.lerp(headingTextStyle, other.headingTextStyle, t) ??
              headingTextStyle,
      oddRowBackgroundColor:
          Color.lerp(oddRowBackgroundColor, other.oddRowBackgroundColor, t) ??
              oddRowBackgroundColor,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
      rowHeight: lerpDouble(rowHeight, other.rowHeight, t) ?? rowHeight,
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
}
