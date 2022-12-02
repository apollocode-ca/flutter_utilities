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
    BuildContext context,
    ColumnData column,
    TextStyle currentStyle,
  ) headingCellBuilder;
  final bool isLoading;
  final Widget Function(
    BuildContext context,
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

  static MaterialScrollableTableState<T>? maybeOf<T>(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    return inherited?.state;
  }

  static MaterialScrollableTableState<T> of<T>(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    if (inherited == null) {
      throw StateError('No MaterialScrollableTable ancestor found');
    }
    return inherited.state;
  }

  @override
  State<MaterialScrollableTable<T>> createState() =>
      MaterialScrollableTableState<T>();
}

class _Inherited<T> extends InheritedWidget {
  const _Inherited({
    required super.child,
    required this.state,
  });

  final MaterialScrollableTableState<T> state;

  @override
  bool updateShouldNotify(covariant _Inherited oldWidget) {
    return oldWidget.state != state;
  }
}

class MaterialScrollableTableState<T>
    extends State<MaterialScrollableTable<T>> {
  static const _listEquality = ListEquality();

  final isRowDragging = <bool>[];

  var _currentlyDraggedRowOffset = Offset.zero;
  var _currentRowIndex = -1;
  var _itemsBeforeDrag = <T>[];
  var _items = <T>[];
  var _startRowIndex = -1;

  double get _rowHeight {
    final rowHeight = Theme.of(context).dataTableTheme.dataRowHeight;
    if (rowHeight != null) {
      return rowHeight;
    }
    throw StateError('dataRowHeight must be set in the DataTableTheme');
  }

  Widget get _rows {
    return ListView.builder(
      itemCount: _items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Builder(
          builder: (context) {
            if (widget.canDrag) {
              return Draggable(
                axis: Axis.vertical,
                data: index,
                feedback: _getRow(item, index),
                child: _getRow(item, index),
                onDragStarted: () {
                  setState(() {
                    _currentRowIndex = index;
                    isRowDragging[index] = true;
                    _itemsBeforeDrag = List.from(_items);
                    _startRowIndex = index;
                  });
                },
                onDragUpdate: (details) {
                  setState(() {
                    _currentlyDraggedRowOffset = _currentlyDraggedRowOffset
                        .translate(0, details.delta.dy);
                    if (_currentlyDraggedRowOffset.dy > _rowHeight ||
                        _currentlyDraggedRowOffset.dy < -_rowHeight) {
                      final indexDelta =
                          (_currentlyDraggedRowOffset.dy / _rowHeight).round();
                      final newRowIndex = (_currentRowIndex + indexDelta)
                          .clamp(0, _items.length - 1)
                          .toInt();
                      _items.swap(_currentRowIndex, newRowIndex);
                      isRowDragging.swap(_currentRowIndex, newRowIndex);
                      _currentRowIndex = newRowIndex;
                      _currentlyDraggedRowOffset = Offset.zero;
                    }
                  });
                },
              );
            }
            return _getRow(item, index);
          },
        );
      },
    );
  }

  Widget _getRow(T item, int index) {
    return ItemRow(
      cellBuilder: widget.itemCellBuilder,
      columns: widget.columns,
      index: index,
      isAnyRowDragging: isRowDragging.any((isDragging) => isDragging),
      isDragging: isRowDragging[index],
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

  _onItemsChange() {
    _items = widget.items;
    for (var i = 0; i < _items.length; i++) {
      isRowDragging.add(false);
    }
  }

  @override
  void initState() {
    super.initState();
    _onItemsChange();
  }

  @override
  void didUpdateWidget(covariant MaterialScrollableTable<T> oldWidget) {
    if (!_listEquality.equals(oldWidget.items, widget.items)) {
      isRowDragging.clear();
      _onItemsChange();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _Inherited<T>(
      state: this,
      child: Container(
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
                  if (_items.isEmpty) {
                    return NoDataBody(
                      labelText: widget.noDataLabel,
                    );
                  }
                  return Builder(
                    builder: (context) {
                      if (widget.canDrag) {
                        return DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return _rows;
                          },
                          onAccept: (data) {
                            final onRowDrag = widget.onRowDrag;
                            if (onRowDrag != null) {
                              onRowDrag(_startRowIndex, _currentRowIndex);
                            }
                            setState(() {
                              _currentlyDraggedRowOffset = Offset.zero;
                              _currentRowIndex = -1;
                              isRowDragging.remove(true);
                              isRowDragging.add(false);
                              _itemsBeforeDrag = <T>[];
                              _startRowIndex = -1;
                            });
                          },
                          onLeave: (data) {
                            setState(() {
                              _currentlyDraggedRowOffset = Offset.zero;
                              _currentRowIndex = -1;
                              isRowDragging.remove(true);
                              isRowDragging.add(false);
                              _items = List.from(_itemsBeforeDrag);
                              _itemsBeforeDrag = <T>[];
                              _startRowIndex = -1;
                            });
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                        );
                      }
                      return _rows;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
