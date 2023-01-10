import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class BottomAppBarThemeProvider
    extends AbstractedThemeProvider<BottomAppBarTheme> {
  final _theme = const BottomAppBarTheme(
    elevation: 2,
    shape: CircularNotchedRectangle(),
  );

  BottomAppBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  BottomAppBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.surface,
    );
  }
}
