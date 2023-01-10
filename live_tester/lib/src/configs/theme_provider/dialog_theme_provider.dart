import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class DialogThemeProvider extends AbstractedThemeProvider<DialogTheme> {
  final _theme = DialogTheme(
    actionsPadding: const EdgeInsets.all(24),
    alignment: Alignment.center,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  );

  DialogThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DialogTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      iconColor: colorScheme.secondary,
      titleTextStyle: textTheme.headlineSmall?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
