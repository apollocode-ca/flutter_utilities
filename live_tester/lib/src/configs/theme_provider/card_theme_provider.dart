import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class CardThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const CardTheme(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    margin: EdgeInsets.all(4),
  );

  CardTheme getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
    );
  }
}
