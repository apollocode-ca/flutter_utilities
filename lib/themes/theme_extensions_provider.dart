import 'package:apollocode_flutter_utilities/themes/interfaces/color_scheme_provider_interface.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_provider.dart';
import 'package:flutter/material.dart';

class ThemeExtensionsProvider {
  final ColorSchemeProviderInterface colorSchemeProvider;
  late final scrollableTableThemeProvider =
      MaterialScrollableTableThemeProvider(
    colorSchemeProvider: colorSchemeProvider,
  );

  ThemeExtensionsProvider({
    required this.colorSchemeProvider,
  });

  List<ThemeExtension> getFrom(Brightness brightness) {
    return [
      scrollableTableThemeProvider.getFrom(brightness),
    ];
  }
}
