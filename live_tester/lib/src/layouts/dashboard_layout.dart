import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/widgets/layout/responsive_padding.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ResponsivePadding(
        helper: FigmaManager.instance.helper,
        child: child,
      ),
    );
  }
}
