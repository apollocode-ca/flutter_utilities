import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/enums/checkbox_state.dart';
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
        Theme.of(context).extension<MaterialScrollableTableThemeData>();
    final backgroundColor = decoration.headingBackgroundColor ??
        theme?.headingBackgroundColor ??
        Theme.of(context).colorScheme.primary;
    final checkboxColumnAlignment = decoration.checkboxColumnAlignment ??
        theme?.checkboxColumnAlignment ??
        AlignmentDirectional.center;
    final checkboxColumnWidth =
        decoration.checkboxColumnWidth ?? theme?.checkboxColumnWidth ?? 48;
    final height = decoration.headingHeight ?? theme?.headingHeight ?? 56;
    final padding = decoration.headingPadding ??
        decoration.padding ??
        theme?.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
        );
    final textStyle = decoration.headingTextStyle ??
        theme?.headingTextStyle ??
        TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
        );
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
                alignment: checkboxColumnAlignment,
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
                    style: textStyle,
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
                  style: textStyle,
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
