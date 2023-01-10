import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonThemeProvider
    extends AbstractedThemeProvider<FloatingActionButtonThemeData> {
  final _helper = FigmaManager.instance.helper;
  final _theme = FloatingActionButtonThemeData(
    disabledElevation: 1,
    elevation: 3,
    enableFeedback: true,
    extendedIconLabelSpacing: 12,
    extendedPadding: const EdgeInsets.only(
      left: 16,
      right: 24,
    ),
    extendedSizeConstraints: const BoxConstraints(
      maxHeight: 56,
      maxWidth: double.infinity,
      minHeight: 56,
      minWidth: 80,
    ),
    focusElevation: 3,
    highlightElevation: 3,
    hoverElevation: 4,
    iconSize: 24,
    largeSizeConstraints: BoxConstraints.tight(
      const Size.square(96),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    sizeConstraints: BoxConstraints.tight(
      const Size.square(56),
    ),
    smallSizeConstraints: BoxConstraints.tight(
      const Size.square(40),
    ),
  );

  FloatingActionButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  FloatingActionButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.primaryContainer,
      extendedTextStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onPrimaryContainer,
      ),
      focusColor: Color.alphaBlend(
        colorScheme.onPrimaryContainer.withOpacity(0.12),
        colorScheme.primaryContainer,
      ),
      foregroundColor: colorScheme.onPrimaryContainer,
      hoverColor: Color.alphaBlend(
        colorScheme.onPrimaryContainer.withOpacity(0.08),
        colorScheme.primaryContainer,
      ),
      splashColor: _helper.isDesktop || _helper.isLaptop
          ? null
          : colorScheme.onPrimaryContainer.withOpacity(0.12),
    );
  }
}
