import 'package:apollocode_flutter_utilities/widgets/fields/dropdown_field/dropdown_overlay.dart';
import 'package:apollocode_flutter_utilities/widgets/fields/material_text_field.dart';
import 'package:apollocode_flutter_utilities/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownField<T> extends StatefulWidget {
  final TextEditingController? controller;
  final bool editable;
  final bool isError;
  final String label;
  final void Function(T suggestion)? onChange;
  final void Function(String value)? onEdit;
  final Widget Function(
    BuildContext context,
    T suggestion, {
    TextStyle? currentTextStyle,
  }) suggestionBuilder;
  final List<T> suggestions;

  const DropdownField({
    this.controller,
    this.editable = false,
    this.isError = false,
    required this.label,
    this.onChange,
    this.onEdit,
    required this.suggestionBuilder,
    required this.suggestions,
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownField<T>> createState() => _State<T>();
}

class _State<T> extends State<DropdownField<T>> {
  late final TextEditingController textFieldController;

  final focusNode = FocusNode();
  final link = LayerLink();
  final textFieldFocusNode = FocusNode();

  var focusedSuggestionIndex = -1;
  var isHovering = false;

  Size? fieldSize;
  OverlayEntry? overlayEntry;
  T? selectedSuggestion;

  String get assetName {
    if (focusNode.hasFocus && !textFieldFocusNode.hasFocus) {
      return 'dropdown_arrow_up';
    }
    return 'dropdown_arrow_down';
  }

  Color get errorColor {
    return Theme.of(context).colorScheme.error;
  }

  Color get errorHoveredColor {
    return Theme.of(context).colorScheme.onErrorContainer;
  }

  Color get focusedColor {
    return Theme.of(context).colorScheme.primary;
  }

  Color get hoveredColor {
    return Theme.of(context).colorScheme.onSurface;
  }

  OverlayEntry createOverlay() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        return DropdownOverlay<T>(
          defaultTextStyle: Theme.of(context).inputDecorationTheme.labelStyle,
          fieldSize: fieldSize,
          focusedSuggestionIndex: focusedSuggestionIndex,
          link: link,
          onChange: onChange,
          suggestionBuilder: widget.suggestionBuilder,
          suggestions: widget.suggestions,
        );
      },
    );
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    focusedSuggestionIndex = -1;
  }

  void onArrowDown() {
    if (focusedSuggestionIndex < widget.suggestions.length - 1) {
      focusedSuggestionIndex += 1;
      showOverlay();
    }
  }

  void onArrowUp() {
    if (focusedSuggestionIndex > -1) {
      focusedSuggestionIndex -= 1;
      showOverlay();
    }
  }

  void onChange(T suggestion) {
    setState(() {
      if (widget.editable) {
        textFieldController.text = suggestion.toString();
      } else {
        selectedSuggestion = suggestion;
      }
    });
    FocusScope.of(context).unfocus();
    final onChange = widget.onChange;
    if (onChange != null) {
      onChange(suggestion);
    }
  }

  void onEnter() {
    setState(() {
      final suggestion = widget.suggestions[focusedSuggestionIndex];
      if (widget.editable) {
        textFieldController.text = suggestion.toString();
      } else {
        selectedSuggestion = suggestion;
      }
    });
    FocusScope.of(context).unfocus();
  }

  void onEscape() {
    FocusScope.of(context).unfocus();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      setState(() {
        isHovering = false;
      });
      if (!textFieldFocusNode.hasFocus) {
        showOverlay();
      }
    } else {
      hideOverlay();
    }
  }

  void onTextFieldFocusChange() {
    if (focusNode.hasFocus) {
      hideOverlay();
    }
  }

  void showOverlay() {
    overlayEntry?.remove();
    overlayEntry = createOverlay();
    final entry = overlayEntry;
    if (entry != null) {
      Overlay.of(context)?.insert(entry);
      entry.markNeedsBuild();
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
    textFieldController = widget.controller ?? TextEditingController();
    textFieldFocusNode.addListener(onTextFieldFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fieldSize = context.size;
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    textFieldFocusNode.removeListener(onTextFieldFocusChange);
    focusNode.dispose();
    if (widget.controller == null) {
      textFieldController.dispose();
    }
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editable && T != String) {
      throw TypeError();
    }
    final theme = Theme.of(context).inputDecorationTheme;
    final enabledBorder = theme.enabledBorder as OutlineInputBorder;
    return CompositedTransformTarget(
      link: link,
      child: GestureDetector(
        onTap: () {
          if (!focusNode.hasFocus && widget.suggestions.isNotEmpty) {
            focusNode.requestFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        child: MouseRegion(
          cursor: () {
            if (widget.suggestions.isNotEmpty) {
              return SystemMouseCursors.click;
            }
            return SystemMouseCursors.basic;
          }(),
          onEnter: (event) {
            setState(() {
              isHovering = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovering = false;
            });
          },
          onHover: (event) {
            if (!focusNode.hasFocus && !isHovering) {
              setState(() {
                isHovering = true;
              });
            }
          },
          child: Focus(
            focusNode: focusNode,
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                  onArrowDown();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                  onArrowUp();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.enter) {
                  onEnter();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.escape) {
                  onEscape();
                  return KeyEventResult.skipRemainingHandlers;
                }
              }
              return KeyEventResult.ignored;
            },
            child: Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints.tightFor(
                height: theme.constraints?.maxHeight,
              ),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  enabledBorder.borderSide.copyWith(
                    color: () {
                      if (widget.isError && isHovering) {
                        return errorHoveredColor;
                      }
                      if (widget.isError) {
                        return errorColor;
                      }
                      if (focusNode.hasFocus) {
                        return focusedColor;
                      }
                      if (isHovering) {
                        return hoveredColor;
                      }
                      return null;
                    }(),
                    width: focusNode.hasFocus ? 2 : null,
                  ),
                ),
                borderRadius: enabledBorder.borderRadius,
              ),
              padding: EdgeInsets.only(
                left: () {
                  if (widget.editable) {
                    return 0;
                  }
                  if (focusNode.hasFocus) {
                    return 15;
                  }
                  return 16;
                }() as double,
                right: focusNode.hasFocus ? 15 : 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (widget.editable) {
                          return MaterialTextField(
                            controller: textFieldController,
                            decoration: const InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                            ),
                            focusNode: textFieldFocusNode,
                            isError: widget.isError,
                            label: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              padding: EdgeInsets.only(
                                bottom: 2,
                                left: enabledBorder.gapPadding,
                                right: enabledBorder.gapPadding,
                              ),
                              child: Text(
                                widget.label,
                              ),
                            ),
                            onChanged: widget.onEdit,
                          );
                        }
                        final selectedSuggestion = this.selectedSuggestion;
                        if (selectedSuggestion != null) {
                          return widget.suggestionBuilder(
                            context,
                            selectedSuggestion,
                          );
                        }
                        return BodyText(
                          widget.label,
                          style: theme.labelStyle?.copyWith(
                            color: () {
                              if (widget.isError && isHovering) {
                                return errorHoveredColor;
                              }
                              if (widget.isError) {
                                return errorColor;
                              }
                              if (focusNode.hasFocus) {
                                return focusedColor;
                              }
                              if (isHovering) {
                                return hoveredColor;
                              }
                              return null;
                            }(),
                          ),
                        );
                      },
                    ),
                  ),
                  Image.asset(
                    'assets/icons/$assetName.png',
                    color: () {
                      if (widget.suggestions.isEmpty) {
                        return Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.38);
                      }
                      return theme.suffixIconColor;
                    }(),
                    filterQuality: FilterQuality.high,
                    package: 'apollocode_flutter_utilities',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
