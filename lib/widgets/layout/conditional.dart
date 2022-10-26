import 'package:apollocode_flutter_utilities/errors/conditional_error.dart';
import 'package:apollocode_flutter_utilities/widgets/layout/conditional/recursive_conditional.dart';
import 'package:flutter/material.dart';

class Conditional extends StatelessWidget {
  final List<Widget> children;
  final List<bool> conditions;

  const Conditional({
    required this.children,
    required this.conditions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.length != conditions.length + 1) {
      throw ConditionalError(children, conditions);
    }
    return LayoutBuilder(builder: (context, constraints) {
      return RecursiveConditional(
        children: children,
        conditions: conditions,
        index: 0,
      );
    });
  }
}
