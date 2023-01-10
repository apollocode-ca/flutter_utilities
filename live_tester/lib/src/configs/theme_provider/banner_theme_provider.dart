import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class BannerThemeProvider
    extends AbstractedThemeProvider<MaterialBannerThemeData> {
  final _helper = FigmaManager.instance.helper;
  final _theme = const MaterialBannerThemeData(
    elevation: 0,
  );

  BannerThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  MaterialBannerThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      contentTextStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      leadingPadding: EdgeInsets.only(
        right: _helper.isDesktop || _helper.isLaptop ? 24 : 16,
      ),
      padding: EdgeInsets.only(
        bottom: 8,
        left: _helper.isDesktop || _helper.isLaptop ? 24 : 16,
        right: 8,
        top: 10,
      ),
    );
  }
}
