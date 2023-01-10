import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class RadioButtonThemeProvider extends AbstractedThemeProvider<RadioThemeData> {
  final _helper = FigmaManager.instance.helper;
  final _theme = const RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
  );

  RadioButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  RadioThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurface;
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurface;
        }
        return colorScheme.onSurfaceVariant;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurface.withOpacity(0.08);
        }
        return null;
      }),
      splashRadius: _helper.isDesktop || _helper.isLaptop ? 0 : 40,
    );
  }
}
