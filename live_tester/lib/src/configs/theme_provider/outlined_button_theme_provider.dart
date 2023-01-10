import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeProvider
    extends AbstractedThemeProvider<OutlinedButtonThemeData> {
  final _borderSide = const BorderSide(
    width: 1,
  );
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

  OutlinedButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  OutlinedButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
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
