import 'package:flutter/material.dart';

class ConditionalError extends Error {
  final List<Widget> children;
  final List<bool> conditions;

  ConditionalError(
    this.children,
    this.conditions,
  );

  @override
  String toString() {
    return 'The Conditional widget must have exactly one child more than the '
        'number of conditions. Actually, there is "${children.length}" '
        'children and "${conditions.length}" conditions.';
  }
}
