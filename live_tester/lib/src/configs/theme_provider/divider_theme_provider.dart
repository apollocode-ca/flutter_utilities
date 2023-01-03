import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class DividerThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const DividerThemeData(
    endIndent: 8,
    indent: 8,
    space: double.infinity,
    thickness: 1,
  );

  DividerThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      color: colorScheme.outline,
    );
  }
}
