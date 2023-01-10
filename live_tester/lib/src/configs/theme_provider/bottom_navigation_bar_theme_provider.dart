import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarThemeProvider
    extends AbstractedThemeProvider<BottomNavigationBarThemeData> {
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

  BottomNavigationBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  BottomNavigationBarThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
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
