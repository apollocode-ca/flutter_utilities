import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/heading_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/item_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/loading_body.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/no_data_body.dart';
import 'package:flutter/material.dart';

class MaterialScrollableTable<T> extends StatelessWidget {
  final List<ColumnData> columns;
  final List<T> items;
  final Widget? Function(ColumnData column) headingCellBuilder;
  final bool isLoading;
  final Widget Function(
    ColumnData column,
    int index,
    TextStyle currentStyle,
  ) itemCellBuilder;
  final String noDataLabel;
  final void Function(T item)? onTap;
  final bool Function(int index)? shouldShowOverlayColor;

  const MaterialScrollableTable({
    required this.columns,
    required this.headingCellBuilder,
    this.isLoading = false,
    this.items = const [],
    required this.itemCellBuilder,
    required this.noDataLabel,
    this.onTap,
    this.shouldShowOverlayColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Column(
        children: [
          HeadingRow(
            cellBuilder: headingCellBuilder,
            columns: columns,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (isLoading) {
                  return const LoadingBody();
                }
                if (items.isEmpty) {
                  return NoDataBody(
                    labelText: noDataLabel,
                  );
                }
                return ListView.builder(
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ItemRow(
                      cellBuilder: itemCellBuilder,
                      columns: columns,
                      index: index,
                      item: item,
                      onTap: onTap,
                      shouldShowOverlayColor: () {
                        final shouldShowOverlayColor =
                            this.shouldShowOverlayColor;
                        if (shouldShowOverlayColor != null) {
                          return shouldShowOverlayColor(index);
                        }
                        return true;
                      }(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
