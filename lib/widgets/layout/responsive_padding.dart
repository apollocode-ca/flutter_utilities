import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/layout/conditional.dart';
import 'package:flutter/material.dart';

class ResponsivePadding extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final DimensionsHelper? helper;

  const ResponsivePadding({
    this.backgroundColor,
    required this.child,
    this.helper,
    Key? key,
  }) : super(key: key);

  bool _isDesktop(BuildContext context) {
    final helper = this.helper;
    if (helper != null) {
      return helper.isDesktop;
    }
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.width >= 1240;
  }

  bool _isLaptop(BuildContext context) {
    final helper = this.helper;
    if (helper != null) {
      return helper.isLaptop;
    }
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.width >= 904 && mediaSize.width < 1240;
  }

  bool _isTablet(BuildContext context) {
    final helper = this.helper;
    if (helper != null) {
      return helper.isTablet;
    }
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.width >= 600 && mediaSize.width < 904;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Conditional(
          conditions: [
            _isDesktop(context),
            _isLaptop(context),
            _isTablet(context),
          ],
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 200,
              ),
              child: child,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size.fromWidth(840),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: child,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: child,
            ),
          ],
        );
      },
    );
  }
}
