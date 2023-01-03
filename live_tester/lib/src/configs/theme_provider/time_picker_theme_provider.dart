import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:flutter/material.dart';

class TimePickerThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _inputDecorationThemeProvider = InputDecorationThemeProvider();
  final _theme = TimePickerThemeData(
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  TimePickerThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      dayPeriodBorderSide: BorderSide(
        color: colorScheme.outline,
        width: 1,
      ),
      dayPeriodColor: colorScheme.surface,
      dayPeriodTextColor: colorScheme.onSurface,
      dayPeriodTextStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      dialBackgroundColor: colorScheme.surfaceVariant,
      dialHandColor: colorScheme.primary,
      dialTextColor: colorScheme.onSurfaceVariant,
      entryModeIconColor: colorScheme.onSurface,
      helpTextStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      hourMinuteColor: colorScheme.surface,
      hourMinuteShape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      hourMinuteTextColor: colorScheme.onSurface,
      hourMinuteTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      inputDecorationTheme: _inputDecorationThemeProvider.getFrom(brightness),
    );
  }
}
