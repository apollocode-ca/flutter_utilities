import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class CardThemeProvider extends AbstractedThemeProvider<CardTheme> {
  final _theme = const CardTheme(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    margin: EdgeInsets.all(4),
  );

  CardThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  CardTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
    );
  }
}
