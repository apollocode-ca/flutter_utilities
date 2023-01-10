import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ToggleButtonsThemeProvider
    extends AbstractedThemeProvider<ToggleButtonsThemeData> {
  final _theme = ToggleButtonsThemeData(
    borderRadius: BorderRadius.circular(8),
    borderWidth: 1,
    constraints: const BoxConstraints(
      maxHeight: 40,
      maxWidth: double.infinity,
      minHeight: 40,
      minWidth: 40,
    ),
    textStyle: textTheme.labelLarge,
  );

  ToggleButtonsThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ToggleButtonsThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      borderColor: colorScheme.outline,
      color: colorScheme.onSurfaceVariant,
      disabledBorderColor: colorScheme.onSurface.withOpacity(0.12),
      disabledColor: colorScheme.onSurface.withOpacity(0.38),
      fillColor: colorScheme.inverseSurface,
      focusColor: colorScheme.onSurfaceVariant.withOpacity(0.12),
      highlightColor: colorScheme.onSurface.withOpacity(0.12),
      hoverColor: colorScheme.onSurfaceVariant.withOpacity(0.08),
      selectedBorderColor: colorScheme.inverseSurface,
      selectedColor: colorScheme.onInverseSurface,
      splashColor: colorScheme.onSurface.withOpacity(0.12),
    );
  }
}
