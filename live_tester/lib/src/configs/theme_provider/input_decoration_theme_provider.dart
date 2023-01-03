import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class InputDecorationThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    gapPadding: 4,
  );
  final _theme = const InputDecorationTheme(
    alignLabelWithHint: false,
    constraints: BoxConstraints.tightFor(
      height: 56,
    ),
    errorMaxLines: 1,
    filled: false,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    helperMaxLines: 1,
    isCollapsed: true,
    isDense: false,
  );

  InputDecorationTheme getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      border: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
      counterStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: textTheme.bodyLarge!.fontSize! / 1.5,
      ),
      disabledBorder: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
      ),
      enabledBorder: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
      errorBorder: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.error,
          width: 1,
        ),
      ),
      errorStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.error,
        fontSize: textTheme.bodyLarge!.fontSize! / 1.5,
      ),
      floatingLabelStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: textTheme.bodyLarge!.fontSize! * 0.9,
      ),
      focusedBorder: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
      ),
      focusedErrorBorder: _inputBorder.copyWith(
        borderSide: BorderSide(
          color: colorScheme.error,
          width: 2,
        ),
      ),
      helperStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: textTheme.bodyLarge!.fontSize! / 1.5,
      ),
      hintStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      iconColor: colorScheme.onSurfaceVariant,
      labelStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      prefixIconColor: colorScheme.onSurfaceVariant,
      prefixStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      suffixIconColor: colorScheme.onSurfaceVariant,
      suffixStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
