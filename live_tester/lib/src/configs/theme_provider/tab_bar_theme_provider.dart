import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class TabBarThemeProvider extends AbstractedThemeProvider<TabBarTheme> {
  final _helper = FigmaManager.instance.helper;
  final _theme = const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.symmetric(
      horizontal: 16,
    ),
  );

  TabBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  TabBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
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
