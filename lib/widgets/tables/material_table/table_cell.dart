import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:flutter/material.dart';

class TableCell extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final Widget? child;
  final ColumnData? column;
  final MaterialScrollableTableDecoration decoration;
  final bool shouldApplyMargin;
  final double? width;

  const TableCell({
    this.alignment,
    this.column,
    required this.decoration,
    this.shouldApplyMargin = false,
    this.width,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<MaterialScrollableTableThemeData>();
    final columnSpacing =
        decoration.columnSpacing ?? theme?.columnSpacing ?? 32;
    return Container(
      alignment: column?.alignment ?? alignment,
      constraints: BoxConstraints.tightFor(
        width: column?.width ?? width,
      ),
      margin: () {
        if (!shouldApplyMargin) {
          return null;
        }
        return EdgeInsets.only(
          left: columnSpacing,
        );
      }(),
      child: child,
    );
  }
}
