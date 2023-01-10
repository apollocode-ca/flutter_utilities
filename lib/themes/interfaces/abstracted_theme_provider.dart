import 'package:apollocode_flutter_utilities/themes/interfaces/color_scheme_provider_interface.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/theme_provider_interface.dart';
import 'package:flutter/material.dart';

/// Abstract theme provider that uses a color scheme provider to dynamically
/// apply the dark or the light theme for the given widget.
///
/// [T] should be the [ThemeData] that should be provided by the [getFrom] method.
abstract class AbstractedThemeProvider<T> implements ThemeProviderInterface<T> {
  final ColorSchemeProviderInterface _colorSchemeProvider;

  const AbstractedThemeProvider({
    required final ColorSchemeProviderInterface colorSchemeProvider,
  }) : _colorSchemeProvider = colorSchemeProvider;

  /// Get a [ThemeData] of type [T] from the given application [brightness].
  @override
  T getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return copyWith(colorScheme);
  }

  T copyWith(ColorScheme colorScheme);
}
