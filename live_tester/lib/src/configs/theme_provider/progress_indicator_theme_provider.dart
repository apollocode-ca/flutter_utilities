import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const ProgressIndicatorThemeData(
    linearMinHeight: 4,
  );

  ProgressIndicatorThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.surfaceVariant,
    );
  }
}
