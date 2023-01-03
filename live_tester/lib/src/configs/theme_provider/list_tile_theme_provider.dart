import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class ListTileThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    dense: false,
    enableFeedback: true,
    horizontalTitleGap: 16,
    minLeadingWidth: 24,
    minVerticalPadding: 8,
    style: ListTileStyle.list,
  );

  ListTileThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      iconColor: colorScheme.onSurface,
      selectedColor: colorScheme.onTertiary,
      selectedTileColor: colorScheme.tertiary,
      textColor: colorScheme.onSurface,
      tileColor: colorScheme.surface,
    );
  }
}
