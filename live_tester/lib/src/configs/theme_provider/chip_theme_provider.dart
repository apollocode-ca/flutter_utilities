import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class ChipThemeProvider {
  final _borderSide = const BorderSide(
    width: 1,
  );
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = ChipThemeData(
    elevation: 0,
    labelPadding: const EdgeInsets.symmetric(
      horizontal: 8,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
    ),
    pressElevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    showCheckmark: true,
  );

  ChipThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      brightness: brightness,
      checkmarkColor: colorScheme.onSurfaceVariant,
      deleteIconColor: colorScheme.onSurfaceVariant,
      disabledColor: colorScheme.surface,
      iconTheme: IconThemeData(
        color: colorScheme.primary,
        size: 18,
      ),
      labelStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      secondaryLabelStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      secondarySelectedColor: colorScheme.secondaryContainer,
      selectedColor: colorScheme.secondaryContainer,
      selectedShadowColor: colorScheme.shadow,
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurface.withOpacity(0.12),
          );
        }
        if (states.contains(MaterialState.focused)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurfaceVariant,
          );
        }
        if (states.isNotEmpty && !states.contains(MaterialState.selected)) {
          return _borderSide.copyWith(
            color: colorScheme.outline,
          );
        }
        return BorderSide.none;
      }),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
