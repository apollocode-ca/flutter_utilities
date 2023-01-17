import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

export 'package:apollocode_flutter_utilities/extensions/text_style_extension.dart';

class TitleText extends StatelessWidget {
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

  const TitleText(
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
    super.key,
  });

  TextOverflow? _getDefaultOverflow(BuildContext context) {
    final overflow = DefaultTextStyle.of(context).overflow;
    if (overflow != TextOverflow.clip) {
      return overflow;
    }
    return null;
  }

  bool? _getDefaultSoftWrap(BuildContext context) {
    final softWrap = DefaultTextStyle.of(context).softWrap;
    if (!softWrap) {
      return softWrap;
    }
    return null;
  }

  TextStyle? _getDefaultStyle(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    if (style != Theme.of(context).textTheme.bodyMedium) {
      return style;
    }
    return null;
  }

  TextStyle? _getResponsiveStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final helper = this.helper;
    if (helper != null) {
      if (helper.isDesktop || helper.isLaptop) {
        return textTheme.titleLarge;
      }
      if (helper.isTablet) {
        return textTheme.titleMedium;
      }
      return textTheme.titleSmall;
    }
    final mediaSize = MediaQuery.of(context).size;
    if (mediaSize.width >= 904) {
      return textTheme.titleLarge;
    }
    if (mediaSize.width >= 600 && mediaSize.width < 904) {
      return textTheme.titleMedium;
    }
    return textTheme.titleSmall;
  }

  TextHeightBehavior? _getTextHeightBehavior(BuildContext context) {
    final textHeightBehavior = DefaultTextStyle.of(context).textHeightBehavior;
    return this.textHeightBehavior ?? textHeightBehavior;
  }

  TextWidthBasis? _getTextWidthBasis(BuildContext context) {
    final textWidthBasis = DefaultTextStyle.of(context).textWidthBasis;
    if (textWidthBasis != TextWidthBasis.parent) {
      return this.textWidthBasis ?? textWidthBasis;
    }
    return this.textWidthBasis;
  }

  TextStyle? getStyle(BuildContext context) {
    final responsiveStyle = _getResponsiveStyle(context);
    final style = this.style ?? _getDefaultStyle(context);
    return responsiveStyle?.copyWith(
      background: style?.background,
      backgroundColor: style?.backgroundColor,
      color: style?.color,
      decoration: style?.decoration,
      decorationColor: style?.decorationColor,
      decorationStyle: style?.decorationStyle,
      decorationThickness: style?.decorationThickness,
      debugLabel: style?.debugLabel,
      fontFamily: style?.fontFamily,
      fontFamilyFallback: style?.fontFamilyFallback,
      fontFeatures: style?.fontFeatures,
      fontSize: style?.fontSize,
      fontStyle: style?.fontStyle,
      fontVariations: style?.fontVariations,
      fontWeight: style?.fontWeight,
      foreground: style?.foreground,
      height: style?.height,
      inherit: style?.inherit,
      leadingDistribution: style?.leadingDistribution,
      letterSpacing: style?.letterSpacing,
      locale: style?.locale,
      overflow: style?.overflow,
      shadows: style?.shadows,
      textBaseline: style?.textBaseline,
      wordSpacing: style?.wordSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      locale: locale,
      maxLines: maxLines ?? DefaultTextStyle.of(context).maxLines,
      overflow: overflow ?? _getDefaultOverflow(context),
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap ?? _getDefaultSoftWrap(context),
      strutStyle: strutStyle,
      style: getStyle(context),
      textAlign: textAlign ?? DefaultTextStyle.of(context).textAlign,
      textDirection: textDirection,
      textHeightBehavior: _getTextHeightBehavior(context),
      textScaleFactor: textScaleFactor,
      textWidthBasis: _getTextWidthBasis(context),
    );
  }
}
