import 'dart:ui';

import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialTextField extends StatefulWidget {
  final bool autocorrect;
  final Iterable<String> autofillHints;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final Widget? Function(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  })? buildCounter;
  final Clip clipBehavior;
  final TextEditingController? controller;
  final Widget? counter;
  final String? counterText;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final InputDecoration decoration;
  final DragStartBehavior dragStartBehavior;
  final bool enabled;
  final bool enableIMEPersonalizedLearning;
  final bool enableInteractiveSelection;
  final bool enableSuggestions;
  final String? errorText;
  final bool expands;
  final FocusNode? focusNode;
  final DimensionsHelper? helper;
  final String? helperText;
  final String? hintText;
  final Widget? icon;
  final String? initialValue;
  final List<TextInputFormatter> inputFormatters;
  final bool isError;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final Widget? label;
  final String? labelText;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int maxLines;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool obscureText;
  final String obscuringCharacter;
  final void Function(
    String action,
    Map<String, dynamic> data,
  )? onAppPrivateCommand;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onSubmitted;
  final void Function()? onTap;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final bool readOnly;
  final String? restorationId;
  final bool scribbleEnabled;
  final ScrollController? scrollController;
  final EdgeInsets scrollPadding;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final ToolbarOptions? toolbarOptions;
  final String? Function(String? value)? validator;
  final bool withForm;

  const MaterialTextField({
    this.autocorrect = true,
    this.autofillHints = const <String>[],
    this.autofocus = false,
    this.autovalidateMode,
    this.buildCounter,
    this.clipBehavior = Clip.antiAlias,
    this.controller,
    this.counter,
    this.counterText,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2,
    this.decoration = const InputDecoration(),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.errorText,
    this.expands = false,
    this.focusNode,
    this.helper,
    this.helperText,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters = const <TextInputFormatter>[],
    this.isError = false,
    this.keyboardAppearance,
    this.keyboardType,
    this.label,
    this.labelText,
    this.maxLengthEnforcement,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.onAppPrivateCommand,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onSubmitted,
    this.onTap,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.readOnly = false,
    this.restorationId,
    this.scribbleEnabled = true,
    this.scrollController,
    this.scrollPadding = const EdgeInsets.all(20),
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.strutStyle,
    this.style,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.toolbarOptions,
    this.validator,
    this.withForm = false,
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialTextField> createState() => _State();
}

class _State extends State<MaterialTextField> {
  late final FocusNode focusNode;

  var isError = false;
  var isHovered = false;

  Color? borderColor;
  Color? decorationColor;
  Color? supportingDecorationColor;

  TextStyle? get counterStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.counterStyle?.background,
      backgroundColor: widget.decoration.counterStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.counterStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.counterStyle?.decorationColor,
      decorationStyle: widget.decoration.counterStyle?.decorationStyle,
      decorationThickness: widget.decoration.counterStyle?.decorationThickness,
      debugLabel: widget.decoration.counterStyle?.debugLabel,
      fontFamily: widget.decoration.counterStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.counterStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.counterStyle?.fontFeatures,
      fontSize: () {
        final fontSize = responsiveStyle?.fontSize as double;
        return widget.decoration.counterStyle?.fontSize ?? fontSize * 0.9;
      }(),
      fontStyle: widget.decoration.counterStyle?.fontStyle,
      fontVariations: widget.decoration.counterStyle?.fontVariations,
      fontWeight: widget.decoration.counterStyle?.fontWeight,
      foreground: widget.decoration.counterStyle?.foreground,
      height: () {
        final height = responsiveStyle?.height as double;
        return widget.decoration.counterStyle?.height ?? height * 0.9;
      }(),
      inherit: widget.decoration.counterStyle?.inherit,
      leadingDistribution: widget.decoration.counterStyle?.leadingDistribution,
      letterSpacing: widget.decoration.counterStyle?.letterSpacing,
      locale: widget.decoration.counterStyle?.locale,
      overflow: widget.decoration.counterStyle?.overflow,
      shadows: widget.decoration.counterStyle?.shadows,
      textBaseline: widget.decoration.counterStyle?.textBaseline,
      wordSpacing: widget.decoration.counterStyle?.wordSpacing,
    );
  }

  InputDecoration get decoration {
    final enabledBorder = widget.decoration.enabledBorder ??
        Theme.of(context).inputDecorationTheme.enabledBorder;
    final focusedBorder = widget.decoration.focusedBorder ??
        Theme.of(context).inputDecorationTheme.focusedBorder;
    return widget.decoration.copyWith(
      counter: widget.counter,
      counterStyle: counterStyle?.copyWith(
        color: supportingDecorationColor,
      ),
      counterText: widget.counterText,
      enabledBorder: enabledBorder?.copyWith(
        borderSide: enabledBorder.borderSide.copyWith(
          color: () {
            if (shouldThemeForError && !isHovered) {
              return Theme.of(context).colorScheme.error;
            }
            return borderColor;
          }(),
        ),
      ),
      errorStyle: errorStyle,
      errorText: widget.errorText,
      floatingLabelStyle: floatingLabelStyle?.copyWith(
        color: decorationColor,
      ),
      focusedBorder: focusedBorder?.copyWith(
        borderSide: focusedBorder.borderSide.copyWith(
          color: () {
            if (shouldThemeForError) {
              return Theme.of(context).colorScheme.error;
            }
            return borderColor;
          }(),
        ),
      ),
      helperStyle: helperStyle?.copyWith(
        color: supportingDecorationColor,
      ),
      helperText: widget.helperText,
      hintStyle: hintStyle?.copyWith(
        color: decorationColor,
      ),
      hintText: widget.hintText,
      icon: widget.icon,
      iconColor: () {
        if (widget.enabled) {
          return null;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      label: widget.label,
      labelStyle: labelStyle?.copyWith(
        color: decorationColor,
      ),
      labelText: widget.labelText,
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
      prefixIconColor: () {
        if (widget.enabled) {
          return null;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      prefixStyle: prefixStyle?.copyWith(
        color: decorationColor,
      ),
      prefixText: widget.prefixText,
      suffix: widget.suffix,
      suffixIcon: widget.suffixIcon,
      suffixIconColor: () {
        if (widget.enabled) {
          return null;
        }
        if (shouldThemeForError) {
          return decorationColor ?? Theme.of(context).colorScheme.error;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      suffixStyle: suffixStyle?.copyWith(
        color: decorationColor,
      ),
      suffixText: widget.suffixText,
    );
  }

  TextStyle? get errorStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.errorStyle?.background,
      backgroundColor: widget.decoration.errorStyle?.backgroundColor,
      color: widget.decoration.errorStyle?.color,
      decorationColor: widget.decoration.errorStyle?.decorationColor,
      decorationStyle: widget.decoration.errorStyle?.decorationStyle,
      decorationThickness: widget.decoration.errorStyle?.decorationThickness,
      debugLabel: widget.decoration.errorStyle?.debugLabel,
      fontFamily: widget.decoration.errorStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.errorStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.errorStyle?.fontFeatures,
      fontSize: () {
        final fontSize = responsiveStyle?.fontSize as double;
        return widget.decoration.errorStyle?.fontSize ?? fontSize * 0.9;
      }(),
      fontStyle: widget.decoration.errorStyle?.fontStyle,
      fontVariations: widget.decoration.errorStyle?.fontVariations,
      fontWeight: widget.decoration.errorStyle?.fontWeight,
      foreground: widget.decoration.errorStyle?.foreground,
      height: () {
        final height = responsiveStyle?.height as double;
        return widget.decoration.errorStyle?.height ?? height * 0.9;
      }(),
      inherit: widget.decoration.errorStyle?.inherit,
      leadingDistribution: widget.decoration.errorStyle?.leadingDistribution,
      letterSpacing: widget.decoration.errorStyle?.letterSpacing,
      locale: widget.decoration.errorStyle?.locale,
      overflow: widget.decoration.errorStyle?.overflow,
      shadows: widget.decoration.errorStyle?.shadows,
      textBaseline: widget.decoration.errorStyle?.textBaseline,
      wordSpacing: widget.decoration.errorStyle?.wordSpacing,
    );
  }

  TextStyle? get floatingLabelStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.floatingLabelStyle?.background,
      backgroundColor: widget.decoration.floatingLabelStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.floatingLabelStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.floatingLabelStyle?.decorationColor,
      decorationStyle: widget.decoration.floatingLabelStyle?.decorationStyle,
      decorationThickness:
          widget.decoration.floatingLabelStyle?.decorationThickness,
      debugLabel: widget.decoration.floatingLabelStyle?.debugLabel,
      fontFamily: widget.decoration.floatingLabelStyle?.fontFamily,
      fontFamilyFallback:
          widget.decoration.floatingLabelStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.floatingLabelStyle?.fontFeatures,
      fontSize: () {
        final fontSize = responsiveStyle?.fontSize as double;
        return widget.decoration.floatingLabelStyle?.fontSize ?? fontSize * 0.9;
      }(),
      fontStyle: widget.decoration.floatingLabelStyle?.fontStyle,
      fontVariations: widget.decoration.floatingLabelStyle?.fontVariations,
      fontWeight: widget.decoration.floatingLabelStyle?.fontWeight,
      foreground: widget.decoration.floatingLabelStyle?.foreground,
      height: () {
        final height = responsiveStyle?.height as double;
        return widget.decoration.floatingLabelStyle?.height ?? height * 0.9;
      }(),
      inherit: widget.decoration.floatingLabelStyle?.inherit,
      leadingDistribution:
          widget.decoration.floatingLabelStyle?.leadingDistribution,
      letterSpacing: widget.decoration.floatingLabelStyle?.letterSpacing,
      locale: widget.decoration.floatingLabelStyle?.locale,
      overflow: widget.decoration.floatingLabelStyle?.overflow,
      shadows: widget.decoration.floatingLabelStyle?.shadows,
      textBaseline: widget.decoration.floatingLabelStyle?.textBaseline,
      wordSpacing: widget.decoration.floatingLabelStyle?.wordSpacing,
    );
  }

  TextStyle? get helperStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.helperStyle?.background,
      backgroundColor: widget.decoration.helperStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.helperStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.helperStyle?.decorationColor,
      decorationStyle: widget.decoration.helperStyle?.decorationStyle,
      decorationThickness: widget.decoration.helperStyle?.decorationThickness,
      debugLabel: widget.decoration.helperStyle?.debugLabel,
      fontFamily: widget.decoration.helperStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.helperStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.helperStyle?.fontFeatures,
      fontSize: () {
        final fontSize = responsiveStyle?.fontSize as double;
        return widget.decoration.helperStyle?.fontSize ?? fontSize * 0.9;
      }(),
      fontStyle: widget.decoration.helperStyle?.fontStyle,
      fontVariations: widget.decoration.helperStyle?.fontVariations,
      fontWeight: widget.decoration.helperStyle?.fontWeight,
      foreground: widget.decoration.helperStyle?.foreground,
      height: () {
        final height = responsiveStyle?.height as double;
        return widget.decoration.helperStyle?.height ?? height * 0.9;
      }(),
      inherit: widget.decoration.helperStyle?.inherit,
      leadingDistribution: widget.decoration.helperStyle?.leadingDistribution,
      letterSpacing: widget.decoration.helperStyle?.letterSpacing,
      locale: widget.decoration.helperStyle?.locale,
      overflow: widget.decoration.helperStyle?.overflow,
      shadows: widget.decoration.helperStyle?.shadows,
      textBaseline: widget.decoration.helperStyle?.textBaseline,
      wordSpacing: widget.decoration.helperStyle?.wordSpacing,
    );
  }

  TextStyle? get hintStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.hintStyle?.background,
      backgroundColor: widget.decoration.hintStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.hintStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.hintStyle?.decorationColor,
      decorationStyle: widget.decoration.hintStyle?.decorationStyle,
      decorationThickness: widget.decoration.hintStyle?.decorationThickness,
      debugLabel: widget.decoration.hintStyle?.debugLabel,
      fontFamily: widget.decoration.hintStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.hintStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.hintStyle?.fontFeatures,
      fontSize: widget.decoration.hintStyle?.fontSize,
      fontStyle: widget.decoration.hintStyle?.fontStyle,
      fontVariations: widget.decoration.hintStyle?.fontVariations,
      fontWeight: widget.decoration.hintStyle?.fontWeight,
      foreground: widget.decoration.hintStyle?.foreground,
      height: widget.decoration.hintStyle?.height,
      inherit: widget.decoration.hintStyle?.inherit,
      leadingDistribution: widget.decoration.hintStyle?.leadingDistribution,
      letterSpacing: widget.decoration.hintStyle?.letterSpacing,
      locale: widget.decoration.hintStyle?.locale,
      overflow: widget.decoration.hintStyle?.overflow,
      shadows: widget.decoration.hintStyle?.shadows,
      textBaseline: widget.decoration.hintStyle?.textBaseline,
      wordSpacing: widget.decoration.hintStyle?.wordSpacing,
    );
  }

  TextStyle? get labelStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.labelStyle?.background,
      backgroundColor: widget.decoration.labelStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.labelStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.labelStyle?.decorationColor,
      decorationStyle: widget.decoration.labelStyle?.decorationStyle,
      decorationThickness: widget.decoration.labelStyle?.decorationThickness,
      debugLabel: widget.decoration.labelStyle?.debugLabel,
      fontFamily: widget.decoration.labelStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.labelStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.labelStyle?.fontFeatures,
      fontSize: widget.decoration.labelStyle?.fontSize,
      fontStyle: widget.decoration.labelStyle?.fontStyle,
      fontVariations: widget.decoration.labelStyle?.fontVariations,
      fontWeight: widget.decoration.labelStyle?.fontWeight,
      foreground: widget.decoration.labelStyle?.foreground,
      height: widget.decoration.labelStyle?.height,
      inherit: widget.decoration.labelStyle?.inherit,
      leadingDistribution: widget.decoration.labelStyle?.leadingDistribution,
      letterSpacing: widget.decoration.labelStyle?.letterSpacing,
      locale: widget.decoration.labelStyle?.locale,
      overflow: widget.decoration.labelStyle?.overflow,
      shadows: widget.decoration.labelStyle?.shadows,
      textBaseline: widget.decoration.labelStyle?.textBaseline,
      wordSpacing: widget.decoration.labelStyle?.wordSpacing,
    );
  }

  TextStyle? get prefixStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.prefixStyle?.background,
      backgroundColor: widget.decoration.prefixStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.prefixStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.prefixStyle?.decorationColor,
      decorationStyle: widget.decoration.prefixStyle?.decorationStyle,
      decorationThickness: widget.decoration.prefixStyle?.decorationThickness,
      debugLabel: widget.decoration.prefixStyle?.debugLabel,
      fontFamily: widget.decoration.prefixStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.prefixStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.prefixStyle?.fontFeatures,
      fontSize: widget.decoration.prefixStyle?.fontSize,
      fontStyle: widget.decoration.prefixStyle?.fontStyle,
      fontVariations: widget.decoration.prefixStyle?.fontVariations,
      fontWeight: widget.decoration.prefixStyle?.fontWeight,
      foreground: widget.decoration.prefixStyle?.foreground,
      height: widget.decoration.prefixStyle?.height,
      inherit: widget.decoration.prefixStyle?.inherit,
      leadingDistribution: widget.decoration.prefixStyle?.leadingDistribution,
      letterSpacing: widget.decoration.prefixStyle?.letterSpacing,
      locale: widget.decoration.prefixStyle?.locale,
      overflow: widget.decoration.prefixStyle?.overflow,
      shadows: widget.decoration.prefixStyle?.shadows,
      textBaseline: widget.decoration.prefixStyle?.textBaseline,
      wordSpacing: widget.decoration.prefixStyle?.wordSpacing,
    );
  }

  TextStyle? get responsiveStyle {
    final textTheme = Theme.of(context).textTheme;
    final helper = widget.helper;
    if (helper != null) {
      if (helper.isDesktop || helper.isLaptop) {
        return textTheme.bodyLarge;
      }
      if (helper.isTablet) {
        return textTheme.bodyMedium;
      }
      return textTheme.bodySmall;
    }
    final mediaSize = MediaQuery.of(context).size;
    if (mediaSize.width >= 904) {
      return textTheme.bodyLarge;
    }
    if (mediaSize.width >= 600 && mediaSize.width < 904) {
      return textTheme.bodyMedium;
    }
    return textTheme.bodySmall;
  }

  bool get shouldThemeForError {
    return isError || widget.errorText != null || widget.isError;
  }

  TextStyle? get style {
    return responsiveStyle?.copyWith(
      background: widget.style?.background,
      backgroundColor: widget.style?.backgroundColor,
      color: () {
        if (widget.enabled) {
          return widget.style?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.style?.decorationColor,
      decorationStyle: widget.style?.decorationStyle,
      decorationThickness: widget.style?.decorationThickness,
      debugLabel: widget.style?.debugLabel,
      fontFamily: widget.style?.fontFamily,
      fontFamilyFallback: widget.style?.fontFamilyFallback,
      fontFeatures: widget.style?.fontFeatures,
      fontSize: widget.style?.fontSize,
      fontStyle: widget.style?.fontStyle,
      fontVariations: widget.style?.fontVariations,
      fontWeight: widget.style?.fontWeight,
      foreground: widget.style?.foreground,
      height: widget.style?.height,
      inherit: widget.style?.inherit,
      leadingDistribution: widget.style?.leadingDistribution,
      letterSpacing: widget.style?.letterSpacing,
      locale: widget.style?.locale,
      overflow: widget.style?.overflow,
      shadows: widget.style?.shadows,
      textBaseline: widget.style?.textBaseline,
      wordSpacing: widget.style?.wordSpacing,
    );
  }

  TextStyle? get suffixStyle {
    return responsiveStyle?.copyWith(
      background: widget.decoration.suffixStyle?.background,
      backgroundColor: widget.decoration.suffixStyle?.backgroundColor,
      color: () {
        if (shouldThemeForError) {
          return Theme.of(context).colorScheme.error;
        }
        if (widget.enabled) {
          return widget.decoration.suffixStyle?.color;
        }
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }(),
      decorationColor: widget.decoration.suffixStyle?.decorationColor,
      decorationStyle: widget.decoration.suffixStyle?.decorationStyle,
      decorationThickness: widget.decoration.suffixStyle?.decorationThickness,
      debugLabel: widget.decoration.suffixStyle?.debugLabel,
      fontFamily: widget.decoration.suffixStyle?.fontFamily,
      fontFamilyFallback: widget.decoration.suffixStyle?.fontFamilyFallback,
      fontFeatures: widget.decoration.suffixStyle?.fontFeatures,
      fontSize: widget.decoration.suffixStyle?.fontSize,
      fontStyle: widget.decoration.suffixStyle?.fontStyle,
      fontVariations: widget.decoration.suffixStyle?.fontVariations,
      fontWeight: widget.decoration.suffixStyle?.fontWeight,
      foreground: widget.decoration.suffixStyle?.foreground,
      height: widget.decoration.suffixStyle?.height,
      inherit: widget.decoration.suffixStyle?.inherit,
      leadingDistribution: widget.decoration.suffixStyle?.leadingDistribution,
      letterSpacing: widget.decoration.suffixStyle?.letterSpacing,
      locale: widget.decoration.suffixStyle?.locale,
      overflow: widget.decoration.suffixStyle?.overflow,
      shadows: widget.decoration.suffixStyle?.shadows,
      textBaseline: widget.decoration.suffixStyle?.textBaseline,
      wordSpacing: widget.decoration.suffixStyle?.wordSpacing,
    );
  }

  void onFocusChange() {
    if (focusNode.hasFocus && !shouldThemeForError) {
      setState(() {
        decorationColor = Theme.of(context).colorScheme.primary;
      });
    } else if (shouldThemeForError) {
      setState(() {
        borderColor = Theme.of(context).colorScheme.error;
        decorationColor = Theme.of(context).colorScheme.error;
      });
    } else {
      setState(() {
        borderColor = null;
        decorationColor = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(onFocusChange);
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final constraints = Theme.of(context).inputDecorationTheme.constraints;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: constraints?.maxHeight,
      ),
      child: MouseRegion(
        onEnter: (event) {
          if (shouldThemeForError && !focusNode.hasFocus) {
            setState(() {
              isHovered = true;
              borderColor = Theme.of(context).colorScheme.onErrorContainer;
              decorationColor = Theme.of(context).colorScheme.onErrorContainer;
              supportingDecorationColor = Theme.of(context).colorScheme.error;
            });
          } else {
            final onSurface = Theme.of(context).colorScheme.onSurface;
            setState(() {
              isHovered = true;
              if (!focusNode.hasFocus) {
                borderColor = onSurface;
                decorationColor = onSurface;
                supportingDecorationColor = onSurface;
              }
            });
          }
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
            if (!focusNode.hasFocus) {
              borderColor = null;
              decorationColor = null;
              supportingDecorationColor = null;
            }
          });
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (widget.withForm) {
              return TextFormField(
                autocorrect: widget.autocorrect,
                autofillHints: widget.autofillHints,
                autofocus: widget.autofocus,
                autovalidateMode: widget.autovalidateMode,
                buildCounter: widget.buildCounter,
                controller: widget.controller,
                cursorColor: () {
                  if (shouldThemeForError) {
                    return Theme.of(context).colorScheme.error;
                  }
                  return widget.cursorColor;
                }(),
                cursorHeight: widget.cursorHeight,
                cursorRadius: widget.cursorRadius,
                cursorWidth: widget.cursorWidth,
                decoration: decoration,
                enabled: widget.enabled,
                enableIMEPersonalizedLearning:
                    widget.enableIMEPersonalizedLearning,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                enableSuggestions: widget.enableSuggestions,
                expands: widget.expands,
                focusNode: focusNode,
                initialValue: widget.initialValue,
                inputFormatters: widget.inputFormatters,
                keyboardAppearance: widget.keyboardAppearance,
                keyboardType: widget.keyboardType,
                maxLength: widget.maxLength,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                mouseCursor: widget.mouseCursor,
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                onChanged: widget.onChanged,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: widget.onSubmitted,
                onSaved: widget.onSaved,
                onTap: widget.onTap,
                readOnly: widget.readOnly,
                restorationId: widget.restorationId,
                scrollController: widget.scrollController,
                scrollPadding: widget.scrollPadding,
                scrollPhysics: widget.scrollPhysics,
                selectionControls: widget.selectionControls,
                showCursor: widget.showCursor,
                smartDashesType: widget.smartDashesType,
                smartQuotesType: widget.smartQuotesType,
                strutStyle: widget.strutStyle,
                style: style,
                textAlign: widget.textAlign,
                textAlignVertical: widget.textAlignVertical,
                textCapitalization: widget.textCapitalization,
                textDirection: widget.textDirection,
                textInputAction: widget.textInputAction,
                toolbarOptions: widget.toolbarOptions,
                validator: (value) {
                  final validator = widget.validator;
                  if (validator != null) {
                    final errorText = validator(value);
                    if (errorText != null && !isError) {
                      setState(() {
                        isError = true;
                      });
                    } else if (errorText == null && isError) {
                      setState(() {
                        isError = false;
                      });
                    }
                    return errorText;
                  }
                  return null;
                },
              );
            }
            return TextField(
              autocorrect: widget.autocorrect,
              autofillHints: widget.autofillHints,
              autofocus: widget.autofocus,
              buildCounter: widget.buildCounter,
              clipBehavior: widget.clipBehavior,
              controller: widget.controller,
              cursorColor: () {
                if (shouldThemeForError) {
                  return Theme.of(context).colorScheme.error;
                }
                return widget.cursorColor;
              }(),
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorWidth: widget.cursorWidth,
              decoration: decoration,
              dragStartBehavior: widget.dragStartBehavior,
              enabled: widget.enabled,
              enableIMEPersonalizedLearning:
                  widget.enableIMEPersonalizedLearning,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              enableSuggestions: widget.enableSuggestions,
              expands: widget.expands,
              focusNode: focusNode,
              inputFormatters: widget.inputFormatters,
              keyboardAppearance: widget.keyboardAppearance,
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              maxLengthEnforcement: widget.maxLengthEnforcement,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              mouseCursor: widget.mouseCursor,
              obscureText: widget.obscureText,
              obscuringCharacter: widget.obscuringCharacter,
              onAppPrivateCommand: widget.onAppPrivateCommand,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              restorationId: widget.restorationId,
              scribbleEnabled: widget.scribbleEnabled,
              scrollController: widget.scrollController,
              scrollPadding: widget.scrollPadding,
              scrollPhysics: widget.scrollPhysics,
              selectionControls: widget.selectionControls,
              selectionHeightStyle: widget.selectionHeightStyle,
              selectionWidthStyle: widget.selectionWidthStyle,
              showCursor: widget.showCursor,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              strutStyle: widget.strutStyle,
              style: style,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              textCapitalization: widget.textCapitalization,
              textDirection: widget.textDirection,
              textInputAction: widget.textInputAction,
              toolbarOptions: widget.toolbarOptions,
            );
          },
        ),
      ),
    );
  }
}
