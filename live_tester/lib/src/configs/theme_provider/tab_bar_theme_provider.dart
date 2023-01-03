import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class TabBarThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _theme = const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.symmetric(
      horizontal: 16,
    ),
  );

  TabBarTheme getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
      ),
      labelColor: colorScheme.primary,
      labelStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.primary,
      ),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurface.withOpacity(0.08);
        }
        return null;
      }),
      splashFactory:
          _helper.isDesktop || _helper.isLaptop ? NoSplash.splashFactory : null,
      unselectedLabelColor: colorScheme.primary.withOpacity(0.82),
      unselectedLabelStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.primary.withOpacity(0.82),
      ),
    );
  }
}
