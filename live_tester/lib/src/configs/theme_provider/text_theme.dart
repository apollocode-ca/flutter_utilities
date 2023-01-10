import 'package:apollocode/src/configs/theme_provider/text_theme/desktop_text_styles.dart';
import 'package:apollocode/src/configs/theme_provider/text_theme/mobile_text_styles.dart';
import 'package:apollocode/src/configs/theme_provider/text_theme/tablet_text_styles.dart';
import 'package:flutter/material.dart';

final textTheme = TextTheme(
  displayLarge: desktopDisplay,
  displayMedium: tabletDisplay,
  displaySmall: mobileDisplay,
  headlineLarge: desktopHeadline,
  headlineMedium: tabletHeadline,
  headlineSmall: mobileHeadline,
  titleLarge: desktopTitle,
  titleMedium: tabletTitle,
  titleSmall: mobileTitle,
  labelLarge: desktopLabel,
  labelMedium: tabletLabel,
  labelSmall: mobileLabel,
  bodyLarge: desktopBody,
  bodyMedium: tabletBody,
  bodySmall: mobileBody,
);
