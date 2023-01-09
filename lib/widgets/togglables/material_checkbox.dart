import 'package:apollocode_flutter_utilities/enums/checkbox_state.dart';
import 'package:flutter/material.dart';

/// A checkbox that follows by default the specification of Material 3.
///
/// The checkbox can be hovered, focused, tapped with a full support of dual
/// state and tristate features.
///
/// The background, the foreground and the overlay colors can be provided to
/// override the default theming of Material 3.
///
/// The shape of the checkbox can be also fully personalize by providing a
/// custom [border], a custom border radius and by overriding the box
/// [dimension] and splash radius (that displays the overlay color on user
/// interactions).
///
/// For better accessibility, you can also override the target dimension to
/// allow users to interact with the checkbox on a larger region.
///
/// You can optionnaly provide a state to the checkbox with the enum
/// [CheckboxState]. This way, you can give an initial state to the checkbox or
/// you can have a better control of the state, even if the checkbox is able to
/// manage its state internally.
///
/// The checkbox can also be [tristate] by enabling the correspondant flag.
/// Tristate means that instead of having two possible states (unselected and
/// selected), the checkbox can have a third state (partially selected).
/// However, this third state can be obtained only by provided a [state] to the
/// checkbox. A tristate checkbox will never give itself a partially selected
/// state internally.
///
/// You can further control the state of the checkbox with the [error] and the
/// [disabled] flags. The first allows the checkbox to display an error theme to
/// indicate an error. The second allows the checkbox to disable all user
/// interactions by displaying a disable theme.
///
/// A focus node can also be provided to have a deeper control of what happen
/// when the checkbox gets the focus.
///
/// The [onChanged] callback can be used to get the new state of the
/// checkbox after the user tapped it. So, for example, if the state of the
/// checkbox before of being tapped was partially selected, you will get the
/// state unselected with the callback.
///
/// The [onTap] callback can be used to add extra behavior when the user is
/// tapping the checkkox. For example, if you want to request the focus on a
/// parent widget (to listen to keyboard, let's say), you can do so with this
/// callback.
class MaterialCheckbox extends StatefulWidget {
  /// Background color of the checkbox.
  ///
  /// The background color is the color that will be used to fill the checkbox
  /// when selected or partially selected.
  ///
  /// As the checkbox uses the Material states to manage its display, you must
  /// provide a [MaterialStateProperty] instead of a simple [Color] object.
  ///
  /// For example:
  ///
  /// ```dart
  /// MaterialStateProperty.resolveWith((states) {
  ///   if (states.contains(MaterialState.selected)) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
  ///     }
  ///     if (states.contains(MaterialState.error)) {
  ///       return Theme.of(context).colorScheme.error;
  ///     }
  ///     return Theme.of(context).colorScheme.primary;
  ///   }
  ///   return null;
  /// });
  /// ```
  final MaterialStateProperty<Color?>? backgroundColor;

  /// Border of the checkbox.
  ///
  /// As the checkbox uses the Material states to manage its display, you must
  /// provide a [MaterialStateProperty] instead of a simple [BoxBorder] object.
  ///
  /// For example:
  ///
  /// ```dart
  /// final backgroundColor = MaterialStateProperty.resolveWith((states) {
  ///   if (states.contains(MaterialState.selected)) {
  ///     return null;
  ///   }
  ///   return Border.all(
  ///     color: defaultBorderColor.resolve(states),
  ///     width: 2,
  ///   );
  /// });
  /// ```
  ///
  /// See [backgroundColor] or [foregroundColor] for an example of how to define
  /// the **defaultBorderColor** variable of the example above.
  final MaterialStateProperty<BoxBorder?>? border;

  /// The border radius of the checkbox.
  ///
  /// By default, the radius is 2.
  final double borderRadius;

  /// The dimension of the checkbox.
  ///
  /// Whatever the dimension, the checkbox will always be a square.
  ///
  /// By default, the dimension is 18 (so the checkbox is by default 18x18).
  final double dimension;

  /// A flag to disable the checkbox.
  ///
  /// Enabling it will disable every user interaction with the checkbox,
  /// displaying a disable theme and keeping its current state.
  ///
  /// By default, the flag is disabled, which means the checkbox is enabled.
  final bool disabled;

  /// A flag to indicate that the checkbox is at the root of an error.
  ///
  /// Enabling it will enable an error theme that will take priority over the
  /// default theme until the flag is disabled.
  ///
  /// By default, the flag is disabled, which means the checkbox is not in
  /// error.
  final bool error;

  /// A focus node to control what happens when the checkbox gets the focus.
  ///
  /// By default, the checkbox manage its focus by itself internally, but if a
  /// focus node is provided, it will let the context (the parent widget) manage
  /// its focus.
  final FocusNode? focusNode;

  /// Foreground color of the checkbox.
  ///
  /// The foreground color is the color of the icon inside the checkbox (so the
  /// color of the dash for a partially selected checkbox or the color of the
  /// check mark for a fully selected checkbox).
  ///
  /// As the checkbox uses the Material states to manage its display, you must
  /// provide a [MaterialStateProperty] instead of a simple [Color] object.
  ///
  /// For example:
  ///
  /// ```dart
  /// final foregroundColor = MaterialStateProperty.resolveWith((states) {
  ///   if (states.contains(MaterialState.selected)) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Theme.of(context).colorScheme.surface;
  ///     }
  ///     if (states.contains(MaterialState.error)) {
  ///       return Theme.of(context).colorScheme.onError;
  ///     }
  ///     return Theme.of(context).colorScheme.onPrimary;
  ///   }
  ///   return Colors.transparent;
  /// })
  /// ```
  final MaterialStateProperty<Color?>? foregroundColor;

  /// A callback to get the state of the checkbox any time a user taps on it.
  ///
  /// The state provided by the callback is the new state of the checkbox, that
  /// is the state after the user tapped on the checkbox (and not before).
  final void Function(CheckboxState state)? onChanged;

  /// A callback for when the checkbox is tapped.
  final void Function()? onTap;

  /// Overlay color of the checkbox.
  ///
  /// The overlay color is the color given to the hovered, focused and pressed
  /// animations around the checkbox.
  ///
  /// As the checkbox uses the Material states to manage its display, you must
  /// provide a [MaterialStateProperty] instead of a simple [BoxBorder] object.
  ///
  /// For example:
  ///
  /// ```dart
  /// final overlayColor = MaterialStateProperty.resolveWith((states) {
  ///   Color? focusedColor;
  ///   Color? hoveredColor;
  ///   Color? pressedColor;
  ///   if (states.contains(MaterialState.focused)) {
  ///     focusedColor = getDefaultFocusedColor(states);
  ///   }
  ///   if (states.contains(MaterialState.hovered)) {
  ///     hoveredColor = getDefaultHoveredColor(states);
  ///   }
  ///   if (states.contains(MaterialState.pressed)) {
  ///     pressedColor = getDefaultPressedColor(states);
  ///   }
  ///   if (focusedColor != null && pressedColor != null) {
  ///     return Color.alphaBlend(pressedColor, focusedColor);
  ///   }
  ///   if (focusedColor != null && hoveredColor != null) {
  ///     return Color.alphaBlend(hoveredColor, focusedColor);
  ///   }
  ///   if (pressedColor != null && hoveredColor != null) {
  ///     return Color.alphaBlend(pressedColor, hoveredColor);
  ///   }
  ///   return focusedColor ?? pressedColor ?? hoveredColor;
  /// });
  ///
  /// Color getDefaultFocusedColor(Set<MaterialState> states) {
  ///   if (states.contains(MaterialState.error)) {
  ///     return Theme.of(context).colorScheme.error.withOpacity(0.12);
  ///   }
  ///   if (states.contains(MaterialState.selected)) {
  ///     return Theme.of(context).colorScheme.primary.withOpacity(0.12);
  ///   }
  ///   return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
  /// }
  ///
  /// Color getDefaultHoveredColor(Set<MaterialState> states) {
  ///   if (states.contains(MaterialState.error)) {
  ///     return Theme.of(context).colorScheme.error.withOpacity(0.08);
  ///   }
  ///   if (states.contains(MaterialState.selected)) {
  ///     return Theme.of(context).colorScheme.primary.withOpacity(0.08);
  ///   }
  ///   return Theme.of(context).colorScheme.onSurface.withOpacity(0.08);
  /// }
  ///
  /// Color getDefaultPressedColor(Set<MaterialState> states) {
  ///   if (states.contains(MaterialState.error)) {
  ///     return Theme.of(context).colorScheme.error.withOpacity(0.12);
  ///   }
  ///   if (states.contains(MaterialState.selected)) {
  ///     return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
  ///   }
  ///   return Theme.of(context).colorScheme.primary.withOpacity(0.12);
  /// }
  /// ```
  final MaterialStateProperty<Color?>? overlayColor;

  /// The radius of hovered, focused and pressed animations around the checkbox.
  ///
  /// Unlike the [dimension] of the checkbox, here it's a radius, which means
  /// that the animation dimension is twice the radius.
  ///
  /// By default, the radius is 20.
  final double splashRadius;

  /// The state of the checkbox.
  ///
  /// It can be used to provide an initial state to the checkbox (and then let
  /// the checkbox manage its state internally), or it can be used to manage
  /// entirely the state of the checkbox (but for that, you will have to use the
  /// [onChanged] callback).
  ///
  /// By default, the checkbox will be unselected and will manage its state
  /// internally.
  ///
  /// The checkbox will also never be partially selected internally. To have a
  /// checkbox partially selected, you will need to provided the state.
  ///
  /// You can't provide [CheckboxState.partiallySelected] if the [tristate] flag
  /// has not been enabled. Otherwise, it will throw a [StateError].
  final CheckboxState? state;

  /// The target dimension of any interaction the user can have with the
  /// checkbox.
  ///
  /// By default, the dimension is 48 (which is a little larger than the default
  /// animation dimension, which is 40).
  final double targetDimension;

  /// A flag to turn the checkbox into a tristate checkbox.
  ///
  /// By default, the flag is disabled, which means the checkbox is not
  /// tristate.
  final bool tristate;

  const MaterialCheckbox({
    this.backgroundColor,
    this.border,
    this.borderRadius = 2,
    this.dimension = 18,
    this.disabled = false,
    this.error = false,
    this.focusNode,
    this.foregroundColor,
    this.onChanged,
    this.onTap,
    this.overlayColor,
    this.splashRadius = 20,
    this.state,
    this.targetDimension = 48,
    this.tristate = false,
    super.key,
  });

  @override
  State<MaterialCheckbox> createState() => _State();
}

class _State extends State<MaterialCheckbox> with TickerProviderStateMixin {
  late final Tween<double> fadeTween;
  late final MaterialStatesController statesController;
  late final AnimationController updateController;
  late final Tween<double> updateTween;

  late MaterialStateProperty<Color?> backgroundColor;
  late MaterialStateProperty<BoxBorder?> border;
  late AnimationController fadeController;
  late FocusNode focusNode;
  late MaterialStateProperty<Color?> foregroundColor;
  late MaterialStateProperty<Color?> overlayColor;
  late CheckboxState state;

  var updateTransition = false;

  MaterialStateProperty<Color?> get defaultBackgroundColor {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        if (states.contains(MaterialState.disabled)) {
          return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.error)) {
          return Theme.of(context).colorScheme.error;
        }
        return Theme.of(context).colorScheme.primary;
      }
      return Theme.of(context).colorScheme.surface;
    });
  }

  MaterialStateProperty<BoxBorder?> get defaultBorder {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return null;
      }
      return Border.all(
        color: defaultBorderColor.resolve(states),
        width: 2,
      );
    });
  }

  MaterialStateProperty<Color> get defaultBorderColor {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }
      if (states.contains(MaterialState.error)) {
        return Theme.of(context).colorScheme.error;
      }
      return Theme.of(context).colorScheme.onSurface;
    });
  }

  MaterialStateProperty<Color?> get defaultForegroundColor {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        if (states.contains(MaterialState.disabled)) {
          return Theme.of(context).colorScheme.surface;
        }
        if (states.contains(MaterialState.error)) {
          return Theme.of(context).colorScheme.onError;
        }
        return Theme.of(context).colorScheme.onPrimary;
      }
      return Colors.transparent;
    });
  }

  MaterialStateProperty<Color?> get defaultOverlayColor {
    return MaterialStateProperty.resolveWith((states) {
      Color? focusedColor;
      Color? hoveredColor;
      Color? pressedColor;
      if (states.contains(MaterialState.focused)) {
        focusedColor = getDefaultFocusedColor(states);
      }
      if (states.contains(MaterialState.hovered)) {
        hoveredColor = getDefaultHoveredColor(states);
      }
      if (states.contains(MaterialState.pressed)) {
        pressedColor = getDefaultPressedColor(states);
      }
      if (focusedColor != null && pressedColor != null) {
        return Color.alphaBlend(pressedColor, focusedColor);
      }
      if (focusedColor != null && hoveredColor != null) {
        return Color.alphaBlend(hoveredColor, focusedColor);
      }
      if (pressedColor != null && hoveredColor != null) {
        return Color.alphaBlend(pressedColor, hoveredColor);
      }
      return focusedColor ?? pressedColor ?? hoveredColor;
    });
  }

  double get borderTotalWidth {
    return border.resolve({})?.dimensions.vertical ?? 0;
  }

  void animateFade({
    CheckboxState? externalState,
  }) {
    switch (state) {
      case CheckboxState.partiallySelected:
        if (externalState == CheckboxState.selected) {
          fadeController.reverse().then((value) {
            onAnimationDone(
              externalState: externalState,
            );
            fadeController.forward();
          });
        } else {
          fadeController.reverse().then((value) {
            onAnimationDone(
              externalState: externalState,
            );
          });
        }
        break;
      case CheckboxState.selected:
        if (externalState == CheckboxState.partiallySelected) {
          fadeController.reverse().then((value) {
            onAnimationDone(
              externalState: externalState,
            );
            fadeController.forward();
          });
        } else {
          fadeController.reverse().then((value) {
            onAnimationDone(
              externalState: externalState,
            );
          });
        }
        break;
      case CheckboxState.unselected:
        fadeController.forward().then((value) {
          onAnimationDone(
            externalState: externalState,
          );
        });
        break;
    }
  }

  void checkExternalState() {
    if (!widget.tristate && widget.state == CheckboxState.partiallySelected) {
      throw StateError(
        "The MaterialCheckbox can't be partially selected when the flag "
        'tristate is disabled',
      );
    }
  }

  bool didUpdateBackgroundColor(covariant MaterialCheckbox oldWidget) {
    final oldBackgroundColor = oldWidget.backgroundColor?.resolve({});
    final newBackgroundColor = widget.backgroundColor?.resolve({});
    var didUpdate = oldBackgroundColor != newBackgroundColor;
    for (final state in MaterialState.values) {
      final oldBackgroundColor = oldWidget.backgroundColor?.resolve({state});
      final newBackgroundColor = widget.backgroundColor?.resolve({state});
      didUpdate = didUpdate || oldBackgroundColor != newBackgroundColor;
    }
    return didUpdate;
  }

  bool didUpdateBorder(covariant MaterialCheckbox oldWidget) {
    final oldBorder = oldWidget.border?.resolve({});
    final newBorder = oldWidget.border?.resolve({});
    var didUpdate = oldBorder != newBorder;
    for (final state in MaterialState.values) {
      final oldBorder = oldWidget.border?.resolve({state});
      final newBorder = oldWidget.border?.resolve({state});
      didUpdate = didUpdate || oldBorder != newBorder;
    }
    return didUpdate;
  }

  bool didUpdateForegroundColor(covariant MaterialCheckbox oldWidget) {
    final oldForegroundColor = oldWidget.foregroundColor?.resolve({});
    final newForegroundColor = widget.foregroundColor?.resolve({});
    var didUpdate = oldForegroundColor != newForegroundColor;
    for (final state in MaterialState.values) {
      final oldForegroundColor = oldWidget.foregroundColor?.resolve({state});
      final newForegroundColor = widget.foregroundColor?.resolve({state});
      didUpdate = didUpdate || oldForegroundColor != newForegroundColor;
    }
    return didUpdate;
  }

  bool didUpdateOverlayColor(covariant MaterialCheckbox oldWidget) {
    final oldOverlayColor = oldWidget.overlayColor?.resolve({});
    final newOverlayColor = widget.overlayColor?.resolve({});
    var didUpdate = oldOverlayColor != newOverlayColor;
    for (final state in MaterialState.values) {
      final oldOverlayColor = oldWidget.overlayColor?.resolve({state});
      final newOverlayColor = widget.overlayColor?.resolve({state});
      didUpdate = didUpdate || oldOverlayColor != newOverlayColor;
    }
    return didUpdate;
  }

  Color getDefaultFocusedColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) {
      return Theme.of(context).colorScheme.error.withOpacity(0.12);
    }
    if (states.contains(MaterialState.selected)) {
      return Theme.of(context).colorScheme.primary.withOpacity(0.12);
    }
    return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
  }

  Color getDefaultHoveredColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) {
      return Theme.of(context).colorScheme.error.withOpacity(0.08);
    }
    if (states.contains(MaterialState.selected)) {
      return Theme.of(context).colorScheme.primary.withOpacity(0.08);
    }
    return Theme.of(context).colorScheme.onSurface.withOpacity(0.08);
  }

  Color getDefaultPressedColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) {
      return Theme.of(context).colorScheme.error.withOpacity(0.12);
    }
    if (states.contains(MaterialState.selected)) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    }
    return Theme.of(context).colorScheme.primary.withOpacity(0.12);
  }

  void onAnimationDone({
    CheckboxState? externalState,
  }) {
    setState(() {
      if (externalState == null) {
        state = state.nextState;
      } else {
        state = externalState;
      }
      statesController.update(MaterialState.selected, state.isSelected);
      final onChanged = widget.onChanged;
      if (onChanged != null) {
        onChanged(state);
      }
    });
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() {
        statesController.update(MaterialState.focused, true);
      });
    } else {
      setState(() {
        statesController.update(MaterialState.focused, false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkExternalState();
    state = widget.state ?? CheckboxState.defaultState;
    fadeController = AnimationController(
      duration: kThemeAnimationDuration,
      value: state.isSelected ? 1 : 0,
      vsync: this,
    );
    fadeTween = Tween(
      begin: fadeController.lowerBound,
      end: fadeController.upperBound,
    );
    updateController = AnimationController(
      duration: kThemeAnimationDuration ~/ 2,
      reverseDuration: Duration.zero,
      value: 1,
      vsync: this,
    );
    updateTween = Tween(
      begin: updateController.lowerBound,
      end: updateController.upperBound,
    );
    statesController = MaterialStatesController({
      if (widget.disabled) MaterialState.disabled,
      if (widget.error) MaterialState.error,
      if (state.isSelected) MaterialState.selected,
    });
    backgroundColor = widget.backgroundColor ?? defaultBackgroundColor;
    border = widget.border ?? defaultBorder;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChanged);
    foregroundColor = widget.foregroundColor ?? defaultForegroundColor;
    overlayColor = widget.overlayColor ?? defaultOverlayColor;
  }

  @override
  void didUpdateWidget(covariant MaterialCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (didUpdateBackgroundColor(oldWidget)) {
      backgroundColor = widget.backgroundColor ?? defaultBackgroundColor;
    }
    if (didUpdateBorder(oldWidget)) {
      border = widget.border ?? defaultBorder;
    }
    if (oldWidget.dimension != widget.dimension) {
      updateController.reverse();
      Future.delayed(kThemeAnimationDuration ~/ 2, () {
        updateController.forward();
      });
    }
    if (oldWidget.disabled != widget.disabled) {
      statesController.update(MaterialState.disabled, widget.disabled);
    }
    if (oldWidget.error != widget.error) {
      statesController.update(MaterialState.error, widget.error);
    }
    if (oldWidget.focusNode != widget.focusNode) {
      if (oldWidget.focusNode != null) {
        focusNode.removeListener(onFocusChanged);
      } else {
        focusNode.dispose();
      }
      focusNode = widget.focusNode ?? FocusNode();
    }
    if (didUpdateForegroundColor(oldWidget)) {
      foregroundColor = widget.foregroundColor ?? defaultForegroundColor;
    }
    if (didUpdateOverlayColor(oldWidget)) {
      overlayColor = widget.overlayColor ?? defaultOverlayColor;
    }
    if (oldWidget.state != widget.state && widget.state != state) {
      checkExternalState();
      animateFade(
        externalState: widget.state,
      );
    }
  }

  @override
  void dispose() {
    statesController.dispose();
    focusNode.removeListener(onFocusChanged);
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final states = statesController.value;
    final backgroundColor = this.backgroundColor.resolve(states);
    final border = this.border.resolve(states);
    final foregroundColor = this.foregroundColor.resolve(states);
    final overlayColor = this.overlayColor.resolve(states);
    return MouseRegion(
      cursor: () {
        if (widget.disabled) {
          return MouseCursor.defer;
        }
        return MaterialStateMouseCursor.clickable;
      }(),
      onEnter: (event) {
        if (!states.contains(MaterialState.disabled)) {
          setState(() {
            statesController.update(MaterialState.hovered, true);
          });
        }
      },
      onExit: (event) {
        if (!states.contains(MaterialState.disabled)) {
          setState(() {
            statesController.update(MaterialState.hovered, false);
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (widget.disabled) {
            return null;
          }
          return () {
            animateFade();
            final onTap = widget.onTap;
            if (onTap != null) {
              onTap();
            }
          };
        }(),
        onLongPressCancel: () {
          setState(() {
            statesController.update(MaterialState.pressed, false);
          });
        },
        onLongPressDown: (details) {
          setState(() {
            statesController.update(MaterialState.pressed, true);
          });
        },
        onLongPressUp: () {
          setState(() {
            statesController.update(MaterialState.pressed, false);
          });
        },
        child: Focus(
          focusNode: focusNode,
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tight(
              Size.square(widget.targetDimension),
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: AnimatedContainer(
              alignment: Alignment.center,
              constraints: BoxConstraints.tight(
                Size.square(widget.splashRadius * 2),
              ),
              foregroundDecoration: BoxDecoration(
                color: overlayColor,
                shape: BoxShape.circle,
              ),
              duration: kThemeAnimationDuration,
              child: AnimatedContainer(
                alignment: Alignment.center,
                constraints: BoxConstraints.tight(
                  Size.square(widget.dimension),
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: border,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                duration: kThemeAnimationDuration,
                child: FadeTransition(
                  opacity: updateTween.animate(updateController),
                  child: FadeTransition(
                    opacity: fadeTween.animate(fadeController),
                    child: Icon(
                      () {
                        if (state == CheckboxState.selected) {
                          return Icons.check_rounded;
                        }
                        return Icons.remove_rounded;
                      }(),
                      size: widget.dimension,
                      color: foregroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
