import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class BannerManager {
  final Color? backgroundColor;
  final Color? errorColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  BannerManager({
    this.backgroundColor,
    this.errorColor,
    this.iconColor,
    this.padding,
    this.textStyle,
  });

  late Flushbar _flushbar;

  void showErrorBanner({
    required BuildContext context,
    required String message,
  }) {
    _flushbar = Flushbar(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      blockBackgroundInteraction: true,
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        Icons.error_outline_rounded,
        color: errorColor ?? Theme.of(context).colorScheme.error,
        size:
            textStyle?.height ?? Theme.of(context).textTheme.bodyLarge?.height,
      ),
      leftBarIndicatorColor: iconColor ?? Theme.of(context).colorScheme.primary,
      shouldIconPulse: false,
      mainButton: IconButton(
        onPressed: () {
          _flushbar.dismiss();
        },
        icon: Icon(
          Icons.close,
          color: iconColor ?? Theme.of(context).colorScheme.primary,
        ),
      ),
      messageText: Container(),
      padding: _getPadding(context),
      titleText: Text(
        message,
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
    _flushbar.show(context);
  }

  EdgeInsets _getPadding(BuildContext context) {
    final padding = this.padding;
    if (padding != null) {
      return padding.resolve(
        Directionality.of(context),
      );
    }
    final themePadding = Theme.of(context).bannerTheme.padding;
    if (themePadding != null) {
      return themePadding.resolve(
        Directionality.of(context),
      );
    }
    return const EdgeInsets.all(16);
  }
}
