import 'package:flutter/material.dart';

class ButtonBarThemeProvider {
  ButtonBarThemeData get theme {
    return const ButtonBarThemeData(
      alignment: MainAxisAlignment.center,
      buttonAlignedDropdown: true,
      buttonHeight: 40,
      buttonMinWidth: 64,
      buttonPadding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      buttonTextTheme: ButtonTextTheme.primary,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      mainAxisSize: MainAxisSize.max,
      overflowDirection: VerticalDirection.down,
    );
  }
}
