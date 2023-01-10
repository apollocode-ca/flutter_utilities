import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

/// Interface for theme providers.
///
/// To create a new ThemeProvider, please use the [AbstractedThemeProvider]
/// instead.
abstract class ThemeProviderInterface<T> {
  T getFrom(Brightness brightness);
}
