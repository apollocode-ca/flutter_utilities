import 'package:apollocode_flutter_utilities/errors/theme_extension_error.dart';
import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  T getExtension<T>() {
    final themeExtension = extension<T>();
    if (themeExtension != null) {
      return themeExtension;
    }
    throw ThemeExtensionError(
      extensionType: T,
    );
  }
}
