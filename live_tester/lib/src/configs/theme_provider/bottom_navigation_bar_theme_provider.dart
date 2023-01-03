import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _iconTheme = const IconThemeData(
    size: 24,
  );
  final _theme = const BottomNavigationBarThemeData(
    elevation: 2,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  BottomNavigationBarThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      selectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSecondaryContainer,
      ),
      selectedItemColor: colorScheme.onSurface,
      selectedLabelStyle: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      unselectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      unselectedItemColor: colorScheme.onSurfaceVariant,
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
