import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class SwitchThemeProvider extends AbstractedThemeProvider<SwitchThemeData> {
  final _theme = const SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    splashRadius: 20,
  );

  SwitchThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  SwitchThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurface.withOpacity(0.08);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.surface;
          }
          if (states.isNotEmpty) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.onPrimary;
        }
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.isNotEmpty) {
          return colorScheme.onSurfaceVariant;
        }
        return colorScheme.outline;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return colorScheme.primary;
        }
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.surfaceVariant.withOpacity(0.12);
        }
        return colorScheme.surfaceVariant;
      }),
    );
  }
}
