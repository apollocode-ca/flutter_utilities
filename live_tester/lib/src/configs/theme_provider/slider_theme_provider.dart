import 'package:apollocode/src/configs/theme_provider/text_theme.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class SliderThemeProvider extends AbstractedThemeProvider<SliderThemeData> {
  final _theme = const SliderThemeData(
    minThumbSeparation: 12,
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 20,
    ),
    rangeThumbShape: RoundRangeSliderThumbShape(
      disabledThumbRadius: 10,
      elevation: 1,
      enabledThumbRadius: 10,
      pressedElevation: 1,
    ),
    rangeTickMarkShape: RoundRangeSliderTickMarkShape(
      tickMarkRadius: 2,
    ),
    rangeTrackShape: RoundedRectRangeSliderTrackShape(),
    rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.always,
    thumbShape: RoundSliderThumbShape(
      disabledThumbRadius: 10,
      elevation: 1,
      enabledThumbRadius: 10,
      pressedElevation: 1,
    ),
    tickMarkShape: RoundSliderTickMarkShape(
      tickMarkRadius: 2,
    ),
    trackHeight: 4,
    trackShape: RoundedRectSliderTrackShape(),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
  );

  SliderThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  SliderThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      activeTickMarkColor: colorScheme.onPrimary.withOpacity(0.38),
      activeTrackColor: colorScheme.primary,
      disabledActiveTickMarkColor: colorScheme.onSurface.withOpacity(0.38),
      disabledActiveTrackColor: colorScheme.onSurface.withOpacity(0.38),
      disabledInactiveTickMarkColor: colorScheme.onSurface.withOpacity(0.38),
      disabledInactiveTrackColor: colorScheme.onSurface.withOpacity(0.12),
      disabledThumbColor: Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.38),
        colorScheme.surface,
      ),
      inactiveTickMarkColor: colorScheme.onSurfaceVariant.withOpacity(0.38),
      inactiveTrackColor: colorScheme.surfaceVariant,
      overlappingShapeStrokeColor: colorScheme.primaryContainer,
      overlayColor: colorScheme.primary.withOpacity(0.08),
      thumbColor: colorScheme.primary,
      valueIndicatorColor: colorScheme.primary,
      valueIndicatorTextStyle: textTheme.labelMedium?.copyWith(
        color: colorScheme.onPrimary,
      ),
    );
  }
}
