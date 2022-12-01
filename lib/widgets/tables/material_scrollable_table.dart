import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/heading_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/item_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/loading_body.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/no_data_body.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MaterialScrollableTable<T> extends StatefulWidget {
  final bool canDrag;
  final bool Function(int index)? canTapRow;
  final List<ColumnData> columns;
  final List<T> items;
  final Widget? Function(
    ColumnData column,
    TextStyle currentStyle,
  ) headingCellBuilder;
  final bool Function(int index)? isDraggingRow;
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
    this.canTapRow,
    required this.columns,
    required this.headingCellBuilder,
    this.isDraggingRow,
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

  var itemsBeforeDrag = <T>[];
  var items = <T>[];

  int? startRowIndex;
  int? oldRowIndex;
  Offset? currentlyDraggedRowOffset;

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
            var isDragging = false;
            final isDraggingRow = widget.isDraggingRow;
            if (isDraggingRow != null) {
              isDragging = isDraggingRow(index);
            }
            if (widget.canDrag) {
              return Draggable(
                axis: Axis.vertical,
                feedback: Container(),
                child: getRow(item, index),
                onDragEnd: (details) {
                  setState(() {
                    currentlyDraggedRowOffset = details.offset;
                  });
                },
                onDragStarted: () {
                  setState(() {
                    itemsBeforeDrag = List.from(items);
                    startRowIndex = index;
                    oldRowIndex = index;
                  });
                },
                onDragUpdate: (details) {
                  setState(() {
                    if (details.delta.dy > rowHeight / 2) {
                      final newRowIndex =
                          oldRowIndex! + (details.delta.dy / rowHeight).round();
                      final itemSwapt = items[oldRowIndex!];
                      items[oldRowIndex!] = items[newRowIndex];
                      items[newRowIndex] = itemSwapt;
                      oldRowIndex = newRowIndex;
                    }
                    currentlyDraggedRowOffset = details.delta;
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
      canTap: () {
        final canTapRow = widget.canTapRow;
        if (canTapRow != null) {
          return canTapRow(index);
        }
        return true;
      }(),
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

  void onDragEnd() {
    final onRowDrag = widget.onRowDrag;
    final currentlyDraggedRowOffset = this.currentlyDraggedRowOffset;
    final startRowIndex = this.startRowIndex;
    if (onRowDrag != null &&
        currentlyDraggedRowOffset != null &&
        startRowIndex != null) {
      final newRowIndex =
          startRowIndex + (currentlyDraggedRowOffset.dy / rowHeight).round();
      onRowDrag(startRowIndex, newRowIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  void didUpdateWidget(covariant MaterialScrollableTable<T> oldWidget) {
    if (!listEquality.equals(oldWidget.items, widget.items)) {
      items = widget.items;
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
                          onDragEnd();
                          setState(() {
                            startRowIndex = null;
                            oldRowIndex = null;
                            currentlyDraggedRowOffset = null;
                            itemsBeforeDrag = <T>[];
                          });
                        },
                        onLeave: (data) {
                          setState(() {
                            items = List.from(itemsBeforeDrag);
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
