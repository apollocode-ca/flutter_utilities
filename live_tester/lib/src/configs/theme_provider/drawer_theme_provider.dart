import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class DrawerThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const DrawerThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    width: 360,
  );

  DrawerThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      scrimColor: colorScheme.shadow.withOpacity(0.32),
    );
  }
}
