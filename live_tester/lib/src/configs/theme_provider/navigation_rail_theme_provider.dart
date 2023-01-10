import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class NavigationRailThemeProvider
    extends AbstractedThemeProvider<NavigationRailThemeData> {
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

  NavigationRailThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  NavigationRailThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
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
