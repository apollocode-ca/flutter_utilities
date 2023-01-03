import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class NavigationRailThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _iconTheme = const IconThemeData(
    size: 24,
  );
  final _theme = const NavigationRailThemeData(
    elevation: 0,
    labelType: NavigationRailLabelType.all,
    minExtendedWidth: 360,
    minWidth: 80,
    useIndicator: true,
  );

  NavigationRailThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      selectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSecondaryContainer,
      ),
      selectedLabelTextStyle: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      unselectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
