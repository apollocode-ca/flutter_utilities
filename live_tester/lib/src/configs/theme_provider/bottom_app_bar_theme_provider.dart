import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class BottomAppBarThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const BottomAppBarTheme(
    elevation: 2,
    shape: CircularNotchedRectangle(),
  );

  BottomAppBarTheme getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      color: colorScheme.surface,
    );
  }
}
