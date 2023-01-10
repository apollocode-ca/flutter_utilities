import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class ScrollbarThemeProvider
    extends AbstractedThemeProvider<ScrollbarThemeData> {
  final _theme = ScrollbarThemeData(
    crossAxisMargin: 4,
    mainAxisMargin: 4,
    minThumbLength: 24,
    radius: const Radius.circular(4),
    thickness: MaterialStateProperty.all(8),
    thumbVisibility: MaterialStateProperty.all(true),
    trackVisibility: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return true;
      }
      return false;
    }),
  );

  ScrollbarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ScrollbarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.dragged)) {
          return Color.alphaBlend(
            colorScheme.onPrimary.withOpacity(0.16),
            colorScheme.primary,
          );
        }
        if (states.contains(MaterialState.hovered)) {
          return Color.alphaBlend(
            colorScheme.onPrimary.withOpacity(0.08),
            colorScheme.primary,
          );
        }
        return colorScheme.primary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.primary.withOpacity(0.08);
        }
        return null;
      }),
    );
  }
}
