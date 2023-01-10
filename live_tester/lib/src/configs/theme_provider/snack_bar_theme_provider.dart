import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class SnackBarThemeProvider extends AbstractedThemeProvider<SnackBarThemeData> {
  final _theme = SnackBarThemeData(
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  SnackBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  SnackBarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      actionTextColor: colorScheme.primary,
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onInverseSurface,
      ),
      disabledActionTextColor: colorScheme.primary.withOpacity(0.38),
    );
  }
}
