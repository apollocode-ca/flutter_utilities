import 'package:apollocode_flutter_utilities/errors/conditional_error.dart';
import 'package:apollocode_flutter_utilities/widgets/layout/conditional/recursive_conditional.dart';
import 'package:flutter/material.dart';

class Conditional extends StatelessWidget {
  final List<bool> conditions;
  final List<Widget> children;

  const Conditional({
    required this.conditions,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.length != conditions.length + 1) {
      throw ConditionalError(children, conditions);
    }
    return RecursiveConditional(
      conditions: conditions,
      index: 0,
      children: children,
    );
  }
}
