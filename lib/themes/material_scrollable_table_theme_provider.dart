import 'package:apollocode_flutter_utilities/widgets/tables/material_scrollable_table.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:flutter/material.dart';

/// Theme provider for the [MaterialScrollableTable].
class MaterialScrollableTableThemeProvider
    extends AbstractedThemeProvider<MaterialScrollableTableThemeData> {
  final _theme = MaterialScrollableTableThemeData(
    animationDuration: kThemeAnimationDuration,
    checkboxColumnAlignment: AlignmentDirectional.center,
    checkboxColumnWidth: 48,
    columnSpacing: 32,
    headingHeight: 56,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
    ),
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
    return _theme.copyWith(
      evenRowBackgroundColor: colorScheme.surface,
      evenRowForegroundColor: colorScheme.onSurface,
      headingBackgroundColor: colorScheme.primary,
      headingTextStyle: TextStyle(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      ),
      oddRowBackgroundColor: colorScheme.surfaceVariant,
      oddRowForegroundColor: colorScheme.onSurfaceVariant,
    );
  }
}
