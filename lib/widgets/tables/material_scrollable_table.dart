import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/heading_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/item_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/loading_body.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/no_data_body.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MaterialScrollableTable<T> extends StatefulWidget {
  final bool canDrag;
  final List<ColumnData> columns;
  final List<T> items;
  final Widget? Function(
    ColumnData column,
    TextStyle currentStyle,
  ) headingCellBuilder;
  final bool isLoading;
  final Widget Function(
    ColumnData column,
    int index,
    TextStyle currentStyle,
  ) itemCellBuilder;
  final String noDataLabel;
  final void Function(int oldIndex, int newIndex)? onRowDrag;
  final void Function(T item)? onRowTap;
  final bool Function(int index)? shouldShowOverlayColor;

  const MaterialScrollableTable({
    this.canDrag = false,
    required this.columns,
    required this.headingCellBuilder,
    this.isLoading = false,
    this.items = const [],
    required this.itemCellBuilder,
    required this.noDataLabel,
    this.onRowDrag,
    this.onRowTap,
    this.shouldShowOverlayColor,
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialScrollableTable<T>> createState() => _State<T>();
}

class _State<T> extends State<MaterialScrollableTable<T>> {
  static const listEquality = ListEquality();

  final isRowDragging = <bool>[];

  var currentlyDraggedRowOffset = Offset.zero;
  var currentRowIndex = -1;
  var itemsBeforeDrag = <T>[];
  var items = <T>[];
  var startRowIndex = -1;

  double get rowHeight {
    final rowHeight = Theme.of(context).dataTableTheme.dataRowHeight;
    if (rowHeight != null) {
      return rowHeight;
    }
    throw StateError('dataRowHeight must be set in the DataTableTheme');
  }

  Widget get rows {
    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = items[index];
        return Builder(
          builder: (context) {
            if (widget.canDrag) {
              return Draggable(
                axis: Axis.vertical,
                data: index,
                feedback: Container(),
                child: getRow(item, index),
                onDragStarted: () {
                  setState(() {
                    currentRowIndex = index;
                    isRowDragging[index] = true;
                    itemsBeforeDrag = List.from(items);
                    startRowIndex = index;
                  });
                },
                onDragUpdate: (details) {
                  setState(() {
                    currentlyDraggedRowOffset = currentlyDraggedRowOffset
                        .translate(0, details.delta.dy);
                    if (currentlyDraggedRowOffset.dy > rowHeight ||
                        currentlyDraggedRowOffset.dy < -rowHeight) {
                      final indexDelta =
                          (currentlyDraggedRowOffset.dy / rowHeight).round();
                      final newRowIndex = (currentRowIndex + indexDelta)
                          .clamp(0, items.length - 1)
                          .toInt();
                      items.swap(currentRowIndex, newRowIndex);
                      isRowDragging.swap(currentRowIndex, newRowIndex);
                      currentRowIndex = newRowIndex;
                      currentlyDraggedRowOffset = Offset.zero;
                    }
                  });
                },
              );
            }
            return getRow(item, index);
          },
        );
      },
    );
  }

  Widget getRow(T item, int index) {
    return ItemRow(
      isDragging: isRowDragging[index],
      cellBuilder: widget.itemCellBuilder,
      columns: widget.columns,
      index: index,
      item: item,
      onTap: widget.onRowTap,
      shouldShowOverlayColor: () {
        final shouldShowOverlayColor = widget.shouldShowOverlayColor;
        if (shouldShowOverlayColor != null) {
          return shouldShowOverlayColor(index);
        }
        return true;
      }(),
    );
  }

  onItemsChange() {
    items = widget.items;
    for (var i = 0; i < items.length; i++) {
      isRowDragging.add(false);
    }
  }

  @override
  void initState() {
    super.initState();
    onItemsChange();
  }

  @override
  void didUpdateWidget(covariant MaterialScrollableTable<T> oldWidget) {
    if (!listEquality.equals(oldWidget.items, widget.items)) {
      isRowDragging.clear();
      onItemsChange();
    }
    super.didUpdateWidget(oldWidget);
  }

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
            cellBuilder: widget.headingCellBuilder,
            columns: widget.columns,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (widget.isLoading) {
                  return const LoadingBody();
                }
                if (items.isEmpty) {
                  return NoDataBody(
                    labelText: widget.noDataLabel,
                  );
                }
                return Builder(
                  builder: (context) {
                    if (widget.canDrag) {
                      return DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return rows;
                        },
                        onAccept: (data) {
                          final onRowDrag = widget.onRowDrag;
                          if (onRowDrag != null) {
                            onRowDrag(startRowIndex, currentRowIndex);
                          }
                          setState(() {
                            currentlyDraggedRowOffset = Offset.zero;
                            currentRowIndex = -1;
                            isRowDragging.remove(true);
                            isRowDragging.add(false);
                            itemsBeforeDrag = <T>[];
                            startRowIndex = -1;
                          });
                        },
                        onLeave: (data) {
                          setState(() {
                            currentlyDraggedRowOffset = Offset.zero;
                            currentRowIndex = -1;
                            isRowDragging.remove(true);
                            isRowDragging.add(false);
                            items = List.from(itemsBeforeDrag);
                            itemsBeforeDrag = <T>[];
                            startRowIndex = -1;
                          });
                        },
                        onWillAccept: (data) {
                          return true;
                        },
                      );
                    }
                    return rows;
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
