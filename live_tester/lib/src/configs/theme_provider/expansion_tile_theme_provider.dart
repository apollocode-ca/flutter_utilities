import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ExpansionTileThemeProvider
    extends AbstractedThemeProvider<ExpansionTileThemeData> {
  final _theme = const ExpansionTileThemeData(
    childrenPadding: EdgeInsets.only(
      bottom: 16,
      left: 24,
      right: 24,
      top: 20,
    ),
    expandedAlignment: Alignment.centerLeft,
    tilePadding: EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
  );

  ExpansionTileThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ExpansionTileThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      collapsedBackgroundColor: colorScheme.surface,
      collapsedIconColor: colorScheme.onSurface.withOpacity(0.38),
      collapsedTextColor: colorScheme.onSurface,
      iconColor: colorScheme.onSurface.withOpacity(0.38),
      textColor: colorScheme.onSurface,
    );
  }
}
