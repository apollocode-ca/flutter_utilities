import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class TextSelectionThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();

  TextSelectionThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.surfaceVariant,
      selectionHandleColor: colorScheme.primary,
    );
  }
}
