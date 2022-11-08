import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

class MaterialOutlinedButton extends StatefulWidget {
  final bool autofocus;
  final Widget child;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final DimensionsHelper? helper;
  final void Function(bool value)? onFocusChanged;
  final void Function(bool value)? onHover;
  final void Function()? onLongPressed;
  final void Function()? onPressed;
  final MaterialStatesController? statesController;
  final ButtonStyle? style;

  const MaterialOutlinedButton({
    this.autofocus = false,
    this.clipBehavior = Clip.antiAlias,
    this.focusNode,
    this.helper,
    this.onFocusChanged,
    this.onHover,
    this.onLongPressed,
    required this.onPressed,
    this.statesController,
    this.style,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialOutlinedButton> createState() => _State();
}

class _State extends State<MaterialOutlinedButton> {
  TextStyle? get responsiveTextStyle {
    final textTheme = Theme.of(context).textTheme;
    final helper = widget.helper;
    if (helper != null) {
      if (helper.isDesktop || helper.isLaptop) {
        return textTheme.labelLarge;
      }
      if (helper.isTablet) {
        return textTheme.labelMedium;
      }
      return textTheme.labelSmall;
    }
    final mediaSize = MediaQuery.of(context).size;
    if (mediaSize.width >= 904) {
      return textTheme.labelLarge;
    }
    if (mediaSize.width >= 600 && mediaSize.width < 904) {
      return textTheme.labelMedium;
    }
    return textTheme.labelSmall;
  }

  TextStyle? getTextStyleFor(Set<MaterialState> states) {
    final style = widget.style ?? Theme.of(context).outlinedButtonTheme.style;
    final textStyle = style?.textStyle?.resolve(states);
    return responsiveTextStyle?.copyWith(
      background: textStyle?.background,
      backgroundColor: textStyle?.backgroundColor,
      color: textStyle?.color,
      decorationColor: textStyle?.decorationColor,
      decorationStyle: textStyle?.decorationStyle,
      decorationThickness: textStyle?.decorationThickness,
      debugLabel: textStyle?.debugLabel,
      fontFamily: textStyle?.fontFamily,
      fontFamilyFallback: textStyle?.fontFamilyFallback,
      fontFeatures: textStyle?.fontFeatures,
      fontSize: textStyle?.fontSize,
      fontStyle: textStyle?.fontStyle,
      fontVariations: textStyle?.fontVariations,
      fontWeight: textStyle?.fontWeight,
      foreground: textStyle?.foreground,
      height: textStyle?.height,
      inherit: textStyle?.inherit,
      leadingDistribution: textStyle?.leadingDistribution,
      letterSpacing: textStyle?.letterSpacing,
      locale: textStyle?.locale,
      overflow: textStyle?.overflow,
      shadows: textStyle?.shadows,
      textBaseline: textStyle?.textBaseline,
      wordSpacing: textStyle?.wordSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChanged,
      onHover: widget.onHover,
      onLongPress: widget.onLongPressed,
      onPressed: widget.onPressed,
      statesController: widget.statesController,
      style: widget.style?.copyWith(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return getTextStyleFor(states);
        }),
      ),
      child: widget.child,
    );
  }
}
