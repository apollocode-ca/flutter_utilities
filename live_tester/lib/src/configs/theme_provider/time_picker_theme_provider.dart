import 'package:apollocode/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class TimePickerThemeProvider
    extends AbstractedThemeProvider<TimePickerThemeData> {
  final InputDecorationThemeProvider _inputDecorationThemeProvider;

  final _theme = TimePickerThemeData(
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  TimePickerThemeProvider({
    required super.colorSchemeProvider,
  }) : _inputDecorationThemeProvider = InputDecorationThemeProvider(
          colorSchemeProvider: colorSchemeProvider,
        );

  @override
  TimePickerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
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
