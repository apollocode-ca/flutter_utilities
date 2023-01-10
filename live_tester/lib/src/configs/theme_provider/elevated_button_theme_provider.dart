import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ElevatedButtonThemeProvider
    extends AbstractedThemeProvider<ElevatedButtonThemeData> {
  final _helper = FigmaManager.instance.helper;
  final _style = ButtonStyle(
    alignment: Alignment.center,
    elevation: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return 1;
      }
      return 0;
    }),
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
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  ElevatedButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ElevatedButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return ElevatedButtonThemeData(
      style: _style.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return colorScheme.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          return colorScheme.onPrimary;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.onPrimary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.onPrimary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.onPrimary.withOpacity(0.08);
          }
          return null;
        }),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.shadow;
          }
          return null;
        }),
        splashFactory: _helper.isDesktop || _helper.isLaptop
            ? NoSplash.splashFactory
            : null,
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.38),
            );
          }
          return textTheme.labelLarge?.copyWith(
            color: colorScheme.onPrimary,
          );
        }),
      ),
    );
  }
}
