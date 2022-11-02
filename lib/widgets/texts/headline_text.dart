import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

export 'package:apollocode_flutter_utilities/extensions/text_style_extension.dart';

class HeadlineText extends StatelessWidget {
  final String data;
  final DimensionsHelper? helper;
  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const HeadlineText(
    this.data, {
    this.helper,
    this.locale,
    this.maxLines,
    this.overflow,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
    Key? key,
  }) : super(key: key);

  TextStyle? _getResponsiveStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final helper = this.helper;
    if (helper != null) {
      if (helper.isDesktop || helper.isLaptop) {
        return textTheme.headlineLarge;
      }
      if (helper.isTablet) {
        return textTheme.headlineMedium;
      }
      return textTheme.headlineSmall;
    }
    final mediaSize = MediaQuery.of(context).size;
    if (mediaSize.width >= 904) {
      return textTheme.headlineLarge;
    }
    if (mediaSize.width >= 600 && mediaSize.width < 904) {
      return textTheme.headlineMedium;
    }
    return textTheme.headlineSmall;
  }

  TextStyle? getStyle(BuildContext context) {
    final style = _getResponsiveStyle(context);
    return style?.copyWith(
      background: this.style?.background,
      backgroundColor: this.style?.backgroundColor,
      color: this.style?.color,
      decorationColor: this.style?.decorationColor,
      decorationStyle: this.style?.decorationStyle,
      decorationThickness: this.style?.decorationThickness,
      debugLabel: this.style?.debugLabel,
      fontFamily: this.style?.fontFamily,
      fontFamilyFallback: this.style?.fontFamilyFallback,
      fontFeatures: this.style?.fontFeatures,
      fontVariations: this.style?.fontVariations,
      fontSize: this.style?.fontSize,
      fontStyle: this.style?.fontStyle,
      fontWeight: this.style?.fontWeight,
      foreground: this.style?.foreground,
      height: this.style?.height,
      inherit: this.style?.inherit,
      leadingDistribution: this.style?.leadingDistribution,
      letterSpacing: this.style?.letterSpacing,
      locale: this.style?.locale,
      overflow: this.style?.overflow,
      shadows: this.style?.shadows,
      textBaseline: this.style?.textBaseline,
      wordSpacing: this.style?.wordSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: getStyle(context),
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
