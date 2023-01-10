import 'package:apollocode_flutter_utilities/themes/interfaces/theme_provider_interface.dart';
import 'package:flutter/material.dart';

/// Interface to create a color scheme provider.
///
/// Every project that uses the theme provider structure should use this as
/// interface for their color scheme provider.
abstract class ColorSchemeProviderInterface
    implements ThemeProviderInterface<ColorScheme> {
  /// Get a darker version of the primary color role from the application
  /// [brightness].
  Color getDarkerPrimaryFrom(Brightness brightness);

  /// Get a lighter version or the primary color role from the application
  /// [brightness].
  Color getLighterPrimaryFrom(Brightness brightness);
}
