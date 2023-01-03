import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeProvider {
  final _borderSide = const BorderSide(
    width: 1,
  );
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _style = ButtonStyle(
    alignment: Alignment.center,
    elevation: MaterialStateProperty.all(0),
    enableFeedback: true,
    fixedSize: MaterialStateProperty.all(
      const Size.fromHeight(40),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 24,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  OutlinedButtonThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return OutlinedButtonThemeData(
      style: _style.copyWith(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          return colorScheme.primary;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
          return null;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return _borderSide.copyWith(
              color: colorScheme.onSurface.withOpacity(0.12),
            );
          }
          if (states.contains(MaterialState.focused)) {
            return _borderSide.copyWith(
              color: colorScheme.primary,
            );
          }
          return _borderSide.copyWith(
            color: colorScheme.outline,
          );
        }),
        splashFactory: _helper.isDesktop || _helper.isLaptop
            ? NoSplash.splashFactory
            : null,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.38),
            );
          }
          return textTheme.labelLarge?.copyWith(
            color: colorScheme.primary,
          );
        }),
      ),
    );
  }
}
