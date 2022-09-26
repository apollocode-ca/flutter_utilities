import 'package:flutter/material.dart';

class RecursiveConditional extends StatelessWidget {
  final List<Widget> children;
  final List<bool> conditions;
  final int index;

  const RecursiveConditional({
    required this.children,
    required this.conditions,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index >= conditions.length) {
      return children.last;
    }
    if (conditions[index]) {
      return children[index];
    }
    /* To avoid multiple appearances of the RecursiveConditional widget in the
     * widgets tree, we don't return the RecursiveConditional here in the build
     * method, but we rather call the build method of the new widget created.
     * This conception allows the RecursiveConditional widget to not overflow
     * the widgets Tree.
     * 
     * In summary, we don't do that:
     * 
     * @override
     * Widget build(BuildContext context) {
     *   ...
     *   return RecursiveConditional(
     *     children: children,
     *     conditions: conditions,
     *     index: index + 1,
     *   );
     * }
    */
    final recursive = RecursiveConditional(
      children: children,
      conditions: conditions,
      index: index + 1,
    );
    return recursive.build(context);
  }
}
