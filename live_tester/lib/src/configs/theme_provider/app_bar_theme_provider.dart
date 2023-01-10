import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarThemeProvider extends AbstractedThemeProvider<AppBarTheme> {
  final _iconTheme = const IconThemeData(
    size: 24,
  );
  final _theme = const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 2,
    toolbarHeight: 64,
  );

  AppBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  AppBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      actionsIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      iconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
      surfaceTintColor: colorScheme.surfaceTint,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarColor: colorScheme.surface,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: colorScheme.surface,
        systemNavigationBarDividerColor: colorScheme.outline,
        systemNavigationBarIconBrightness: brightness,
      ),
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
