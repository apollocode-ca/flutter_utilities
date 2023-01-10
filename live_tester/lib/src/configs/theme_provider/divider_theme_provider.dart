import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class DividerThemeProvider extends AbstractedThemeProvider<DividerThemeData> {
  final _theme = const DividerThemeData(
    endIndent: 8,
    indent: 8,
    space: double.infinity,
    thickness: 1,
  );

  DividerThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DividerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.outline,
    );
  }
}
