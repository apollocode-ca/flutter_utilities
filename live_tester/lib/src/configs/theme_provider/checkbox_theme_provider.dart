import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:flutter/material.dart';

class CheckboxThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _theme = const CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    splashRadius: 24,
  );

  CheckboxThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      checkColor: MaterialStateProperty.all(
        colorScheme.onPrimary,
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.primary;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurfaceVariant.withOpacity(0.08);
        }
        return null;
      }),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withOpacity(0.38),
            width: 2,
          );
        }
        return BorderSide(
          color: colorScheme.outline,
          width: 2,
        );
      }),
    );
  }
}
