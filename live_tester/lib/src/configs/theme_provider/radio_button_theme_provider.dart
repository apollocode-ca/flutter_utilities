import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class RadioButtonThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _theme = const RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
  );

  RadioThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
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
