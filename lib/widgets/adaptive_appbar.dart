import 'package:apollocode_flutter_widgets/helpers/adaptive.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  final Color? desktopBackgroundColor;
  final Color? mobileBackgroundColor;
  late bool _isDesktop;

  AdaptiveAppBar(
      {Key? key,
      this.actions = const [],
      this.title = "",
      this.desktopBackgroundColor,
      this.mobileBackgroundColor})
      : super(key: key);

  @override
  Size get preferredSize => _isDesktop
      ? const Size.fromHeight(appBarDesktopHeight)
      : const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    _isDesktop = isDisplayDesktop(context);

    return AppBar(
        automaticallyImplyLeading: !_isDesktop,
        toolbarHeight: 125,
        elevation: 0,
        backgroundColor:
            (_isDesktop) ? desktopBackgroundColor : mobileBackgroundColor,
        centerTitle: true,
        title: (_isDesktop)
            ? Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xFFF5F5F5),
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
        actions: actions);
  }
}
