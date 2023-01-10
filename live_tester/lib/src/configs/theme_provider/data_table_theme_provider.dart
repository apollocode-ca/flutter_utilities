import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class DataTableThemeProvider
    extends AbstractedThemeProvider<DataTableThemeData> {
  final _theme = const DataTableThemeData(
    checkboxHorizontalMargin: 8,
    columnSpacing: 32,
    dataRowHeight: 52,
    dividerThickness: 1,
    headingRowHeight: 56,
    horizontalMargin: 8,
  );

  DataTableThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DataTableThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      dataRowColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onSurfaceVariant;
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.08);
        }
        return null;
      }),
      dataTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.surface,
      ),
      headingTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
