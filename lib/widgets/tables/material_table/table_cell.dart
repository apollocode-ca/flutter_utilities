import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:flutter/material.dart';

class TableCell extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final Widget? child;
  final ColumnData? column;
  final bool shouldApplyMargin;
  final double? width;

  const TableCell({
    this.alignment,
    this.column,
    required this.child,
    this.shouldApplyMargin = false,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: column?.alignment ?? alignment,
      constraints: BoxConstraints.tightFor(
        width: column?.width ?? width,
      ),
      margin: () {
        if (!shouldApplyMargin) {
          return null;
        }
        return const EdgeInsets.only(
          left: 32,
        );
      }(),
      child: child,
    );
  }
}
