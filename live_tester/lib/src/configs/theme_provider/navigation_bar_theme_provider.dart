import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class NavigationBarThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _iconTheme = const IconThemeData(
    size: 24,
  );
  final _theme = NavigationBarThemeData(
    elevation: 2,
    height: 80,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  );

  NavigationBarThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return _iconTheme.copyWith(
            color: colorScheme.onSecondaryContainer,
          );
        }
        return _iconTheme.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      indicatorColor: colorScheme.secondaryContainer,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface,
          );
        }
        return textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
