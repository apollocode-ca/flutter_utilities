import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class TextButtonThemeProvider
    extends AbstractedThemeProvider<TextButtonThemeData> {
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
        horizontal: 12,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  TextButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  TextButtonThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return TextButtonThemeData(
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
        shadowColor: MaterialStateProperty.all(
          colorScheme.shadow,
        ),
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
            color: colorScheme.primary,
          );
        }),
      ),
    );
  }
}
