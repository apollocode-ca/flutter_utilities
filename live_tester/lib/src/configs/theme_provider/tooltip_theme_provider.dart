import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class TooltipThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _theme = const TooltipThemeData(
    enableFeedback: false,
    excludeFromSemantics: false,
    preferBelow: true,
    textAlign: TextAlign.center,
    verticalOffset: 8,
    waitDuration: Duration(
      milliseconds: 400,
    ),
  );

  TooltipThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return _theme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _helper.isDesktop || _helper.isLaptop ? 12 : 16,
        ),
        color: colorScheme.onSurface,
      ),
      height: _helper.isDesktop || _helper.isLaptop ? 24 : 32,
      padding: EdgeInsets.symmetric(
        horizontal: _helper.isDesktop || _helper.isLaptop ? 8 : 16,
      ),
      showDuration: _helper.isDesktop || _helper.isLaptop
          ? null
          : const Duration(
              seconds: 1,
              milliseconds: 500,
            ),
      textStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.surface,
      ),
      triggerMode: _helper.isDesktop || _helper.isLaptop
          ? TooltipTriggerMode.manual
          : TooltipTriggerMode.longPress,
    );
  }
}
