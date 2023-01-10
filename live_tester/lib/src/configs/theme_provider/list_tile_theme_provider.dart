import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ListTileThemeProvider extends AbstractedThemeProvider<ListTileThemeData> {
  final _theme = const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    dense: false,
    enableFeedback: true,
    horizontalTitleGap: 16,
    minLeadingWidth: 24,
    minVerticalPadding: 8,
    style: ListTileStyle.list,
  );

  ListTileThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ListTileThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      iconColor: colorScheme.onSurface,
      selectedColor: colorScheme.onTertiary,
      selectedTileColor: colorScheme.tertiary,
      textColor: colorScheme.onSurface,
      tileColor: colorScheme.surface,
    );
  }
}
