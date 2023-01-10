import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/enums/checkbox_state.dart';
import 'package:apollocode_flutter_utilities/extensions/theme_data_extension.dart';
import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_checkbox.dart';
import 'package:flutter/material.dart' hide TableCell;

class HeadingRow extends StatelessWidget {
  final bool addCheckboxesColumn;
  final Widget? Function(BuildContext context, ColumnData column) cellBuilder;
  final CheckboxState checkboxState;
  final List<ColumnData> columns;
  final MaterialScrollableTableDecoration decoration;
  final void Function(CheckboxState state) onCheckboxChanged;
  final void Function() onCheckboxTap;

  const HeadingRow({
    required this.addCheckboxesColumn,
    required this.cellBuilder,
    required this.checkboxState,
    required this.columns,
    required this.decoration,
    required this.onCheckboxChanged,
    required this.onCheckboxTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).getExtension<MaterialScrollableTableThemeData>();
    final backgroundColor =
        decoration.headingBackgroundColor ?? theme.headingBackgroundColor;
    final checkboxColumnWidth =
        decoration.checkboxColumnWidth ?? theme.checkboxColumnWidth;
    final height = decoration.headingHeight ?? theme.headingHeight;
    final padding =
        decoration.headingPadding ?? decoration.padding ?? theme.padding;
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Container(
      constraints: BoxConstraints.tightFor(
        height: height,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      padding: padding,
      child: Builder(
        builder: (context) {
          final cells = <Widget>[];
          if (addCheckboxesColumn) {
            cells.add(
              TableCell(
                alignment: Alignment.center,
                width: checkboxColumnWidth,
                child: TableCheckbox(
                  isEvenRow: null,
                  onChanged: onCheckboxChanged,
                  onTap: onCheckboxTap,
                  state: checkboxState,
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
