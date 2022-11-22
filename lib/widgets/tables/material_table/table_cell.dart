import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:flutter/material.dart';

class TableCell extends StatelessWidget {
  final Widget? child;
  final ColumnData column;

  const TableCell({
    required this.child,
    required this.column,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: column.alignment,
      constraints: BoxConstraints.tightFor(
        width: column.width,
      ),
      margin: () {
        if (column.index == 0) {
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
