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
  /// The height of the heading of the table.
  ///
  /// By default, the value is 56.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.headingHeight] value when non null.
  final double headingHeight;

  /// The height of a data row in the table.
  ///
  /// By default, the value is 52.
  ///
  /// This value is overriden by the
  /// [MaterialScrollableTableDecoration.rowHeight] value when non null.
  final double rowHeight;

  MaterialScrollableTableThemeData({
    required this.headingHeight,
    required this.rowHeight,
  });

  @override
  MaterialScrollableTableThemeData copyWith({
    final double? headingHeight,
    final double? rowHeight,
  }) {
    return MaterialScrollableTableThemeData(
      headingHeight: headingHeight ?? this.headingHeight,
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
      headingHeight:
          lerpDouble(headingHeight, other.headingHeight, t) ?? headingHeight,
      rowHeight: lerpDouble(rowHeight, other.rowHeight, t) ?? rowHeight,
    );
  }
}
