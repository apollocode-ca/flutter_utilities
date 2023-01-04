import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_checkbox.dart';
import 'package:flutter/material.dart' hide TableCell;

class HeadingRow extends StatelessWidget {
  final bool addCheckboxesColumn;
  final Widget? Function(BuildContext context, ColumnData column) cellBuilder;
  final bool? checkboxValue;
  final List<ColumnData> columns;
  final void Function(bool? value) onCheckboxTap;

  const HeadingRow({
    required this.addCheckboxesColumn,
    required this.cellBuilder,
    required this.checkboxValue,
    required this.columns,
    required this.onCheckboxTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
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
          if (addCheckboxesColumn) {
            cells.add(
              TableCell(
                alignment: Alignment.center,
                width: 32,
                child: TableCheckbox(
                  checkboxValue: checkboxValue,
                  onCheckboxTap: onCheckboxTap,
                ),
              ),
            );
          }
          for (var index = 0; index < columns.length; index++) {
            final column = columns[index];
            if (column.width == null) {
              cells.add(
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: column.textAlign,
                    child: TableCell(
                      column: column,
                      shouldApplyMargin: index != 0 || addCheckboxesColumn,
                      child: cellBuilder(context, column),
                    ),
                  ),
                ),
              );
            } else {
              cells.add(
                DefaultTextStyle(
                  style: TextStyle(
                    color: onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: column.textAlign,
                  child: TableCell(
                    column: column,
                    shouldApplyMargin: index != 0 || addCheckboxesColumn,
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
