import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/themes/interfaces/abstracted_theme_provider.dart';
import 'package:flutter/material.dart';

class BottomSheetThemeProvider
    extends AbstractedThemeProvider<BottomSheetThemeData> {
  final _helper = FigmaManager.instance.helper;
  final _theme = const BottomSheetThemeData(
    clipBehavior: Clip.antiAlias,
    elevation: 1,
    modalElevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
    ),
  );

  BottomSheetThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  BottomSheetThemeData copyWith(
      ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      constraints: BoxConstraints(
        maxHeight: _helper.mediaSize.height,
        maxWidth: 640,
        minHeight: 0,
        minWidth: 0,
      ),
      modalBackgroundColor: colorScheme.surface,
    );
  }
}
