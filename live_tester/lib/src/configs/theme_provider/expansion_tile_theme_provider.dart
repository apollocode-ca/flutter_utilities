import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class ExpansionTileThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
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

  ExpansionTileThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
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
