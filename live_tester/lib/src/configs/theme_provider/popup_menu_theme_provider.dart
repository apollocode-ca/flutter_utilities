import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class PopupMenuThemeProvider
    extends AbstractedThemeProvider<PopupMenuThemeData> {
  final _theme = PopupMenuThemeData(
    elevation: 2,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  PopupMenuThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  PopupMenuThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.surface,
      textStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
