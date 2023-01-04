import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:flutter/material.dart' hide TableCell;

class HeadingRow extends StatelessWidget {
  final Widget? Function(BuildContext context, ColumnData column) cellBuilder;
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
      child: Builder(
        builder: (context) {
          final cells = <Widget>[];
          for (var index = 0; index < columns.length; index++) {
            final column = columns[index];
            if (column.width == null) {
              cells.add(
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: column.textAlign,
                    child: TableCell(
                      column: column,
                      index: index,
                      child: cellBuilder(context, column),
                    ),
                  ),
                ),
              );
            } else {
              cells.add(
                DefaultTextStyle(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: column.textAlign,
                  child: TableCell(
                    column: column,
                    index: index,
                    child: cellBuilder(context, column),
                  ),
                ),
              );
            }
          }
          return Row(
            children: cells,
          );
        },
      ),
    );
  }
}
