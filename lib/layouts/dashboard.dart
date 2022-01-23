import 'package:apollocode_flutter_widgets/helpers/adaptive.dart';
import 'package:apollocode_flutter_widgets/widgets/adaptive_appbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  final Widget menu;
  final double menuWidth;
  const DashboardLayout(this.child, this.menu, {Key? key, this.menuWidth = 125}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final body = SafeArea(
      child: Padding(
        padding: isDesktop
            ? const EdgeInsets.symmetric(horizontal: 72, vertical: 48)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: widget.child,
      ),
    );

    if (isDesktop) {
      return Row(
        children: [
          _ListDrawer(widget.menu, widget.menuWidth),
          Expanded(
            child: Scaffold(
              appBar: AdaptiveAppBar(),
              body: body,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AdaptiveAppBar(),
      body: body,
      drawer: _ListDrawer(widget.menu, widget.menuWidth),
    );
  }
}

class _ListDrawer extends StatelessWidget {
  final Widget menu;
  final double size;
  const _ListDrawer(this.menu, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 50, bottom: 125),
          child: menu,
        ),
      ),
    );
  }
}
