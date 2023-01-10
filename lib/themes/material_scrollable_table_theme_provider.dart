import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:flutter/material.dart';

/// Theme provider for the [MaterialScrollableTable].
///
/// By default, the table has:
/// * a row height of 52 ([MaterialScrollableTableThemeData.rowHeight]).
class MaterialScrollableTableThemeProvider
    extends AbstractedThemeProvider<MaterialScrollableTableThemeData> {
  final _theme = MaterialScrollableTableThemeData(
    rowHeight: 52,
  );

  MaterialScrollableTableThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  @protected
  MaterialScrollableTableThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith();
  }
}
