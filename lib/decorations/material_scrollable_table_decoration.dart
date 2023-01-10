import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';

/// Decoration for the [MaterialScrollableTable].
///
/// The values defined with the decoration will override the values defined in
/// the [MaterialScrollableTableThemeData].
class MaterialScrollableTableDecoration {
  /// The height of a data row in the table.
  ///
  /// By default, the value is 52.
  ///
  /// This value, when non null, will override the
  /// [MaterialScrollableTableThemeData.rowHeight] value.
  final double? rowHeight;

  const MaterialScrollableTableDecoration({
    this.rowHeight,
  });
}
