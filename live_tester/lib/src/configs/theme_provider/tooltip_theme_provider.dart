import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class TooltipThemeProvider extends AbstractedThemeProvider<TooltipThemeData> {
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

  TooltipThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  TooltipThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
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
