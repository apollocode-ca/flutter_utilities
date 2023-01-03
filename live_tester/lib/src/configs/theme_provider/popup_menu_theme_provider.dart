import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class PopupMenuThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = PopupMenuThemeData(
    elevation: 2,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  PopupMenuThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      color: colorScheme.surface,
      textStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
