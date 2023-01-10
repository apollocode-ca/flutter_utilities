import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorThemeProvider
    extends AbstractedThemeProvider<ProgressIndicatorThemeData> {
  final _theme = const ProgressIndicatorThemeData(
    linearMinHeight: 4,
  );

  ProgressIndicatorThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ProgressIndicatorThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.surfaceVariant,
    );
  }
}
