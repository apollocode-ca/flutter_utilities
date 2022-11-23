import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:flutter/material.dart' hide TableCell;

class HeadingRow extends StatelessWidget {
  final Widget? Function(
    ColumnData column,
    TextStyle currentStyle,
  ) cellBuilder;
  final List<ColumnData> columns;

  const HeadingRow({
    required this.cellBuilder,
    required this.columns,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: Theme.of(context).dataTableTheme.headingRowHeight,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        children: [
          ...columns.map((column) {
            if (column.width == null) {
              return Expanded(
                child: TableCell(
                  column: column,
                  child: cellBuilder(
                    column,
                    TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }
            return TableCell(
              column: column,
              child: cellBuilder(
                column,
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
