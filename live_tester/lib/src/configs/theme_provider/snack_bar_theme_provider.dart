import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class SnackBarThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = SnackBarThemeData(
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  SnackBarThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      actionTextColor: colorScheme.primary,
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onInverseSurface,
      ),
      disabledActionTextColor: colorScheme.primary.withOpacity(0.38),
    );
  }
}
