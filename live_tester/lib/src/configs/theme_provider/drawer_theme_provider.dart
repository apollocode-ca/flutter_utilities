import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class DrawerThemeProvider extends AbstractedThemeProvider<DrawerThemeData> {
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

  DrawerThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DrawerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      scrimColor: colorScheme.shadow.withOpacity(0.32),
    );
  }
}
