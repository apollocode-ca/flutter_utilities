import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class BannerThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _theme = const MaterialBannerThemeData(
    elevation: 0,
  );

  MaterialBannerThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
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
