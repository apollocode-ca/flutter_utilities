import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:apollocode_flutter_utilities/extensions/global_key_extension.dart';
import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/models/pagination_data.dart';
import 'package:apollocode_flutter_utilities/widgets/layout/conditional.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/heading_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/item_row.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/loading_body.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/loading_indicator.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/no_data_body.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/pagination_row.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// Table that follows the Material theme specifications and the Flutter
/// [DataTable] sizes.
///
/// The table is also scrollable if there is not enough available space to
/// display all the data rows. As the scrollable region takes as much space as
/// possible, the table must be fully constrained. In a [Column] for example,
/// you must constrain the height of the table with [ConstrainedBox], [SizedBox]
/// or any other container if you want a fixed height. Or you must constrain the
/// height of the table with [Expanded] if you want the table to take as much
/// space as possible.
///
/// When the table doesn't contain any data, an "empty data" message will be
/// displayed in place of the data rows.
///
/// When the table is loading data for the first time, a loading widget will be
/// displayed in place of the data rows. If there is data already in the table
/// and some other data is loading, a loading indicator will be displayed above
/// the table in the top-right corner.
///
/// By default, the table doesn't have any pagination. To provide a pagination
/// row (that will be displayed at the bottom of the table), add some
/// [PaginationData]. Then, use the [onItemsPerPageChanged], [onNextPageTap] and
/// [onPreviousPageTap] callbacks to change data when the pagination
/// configuration changes.
///
/// By default, the table doesn't have any interaction. To add some, provide an
/// [onRowTap] callback. The [shouldShowOverlayColor] callback can let you
/// control when a row should display an overlay animation or not.
///
/// You can also enable row dragging with the [canDrag] flag. The table manages
/// itself the reorder of the data to match the new rows order after a drag has
/// been completed. To add an additional behavior after the drag, use the
/// [onRowDrag] callback.
class MaterialScrollableTable<T> extends StatefulWidget {
  /// A flag to enable or disable the dragging behavior on the table rows.
  ///
  /// By default, it's disabled.
  final bool canDrag;

  /// The list of columns for the table.
  ///
  /// To specify the columns, you must use the [ColumnData] mixin with an enum.
  /// In this enum, you will add every column you want in the table and
  /// [ColumnData] will enforce you to define every specification needed by the
  /// table to build correctly.
  ///
  /// These specifications are:
  /// * [AlignmentGeometry]? alignment: the alignment of the content inside the
  /// column. By default, the alignment is [Alignment.left].
  /// * [TextAlign]? textAlign: the alignment of any text inside the column. By
  /// default, the alignment is [TextAlign.start].
  /// * [double]? width: the width of the column. By default, the column will
  /// take as much space as possible. If more than one column has a default
  /// width, each column will take an equaled part of the remaining space.
  final List<ColumnData> columns;

  /// The items to display in the table.
  ///
  /// Each item should correspond to a row in the table.
  ///
  /// You should use this property only when there is no pagination. When the
  /// table has pagination, using this property has no effect.
  final List<T> items;

  /// The callback to build each heading cell.
  ///
  /// You can return null if you don't want to display anything in the headling
  /// for a specific column. It's useful if, for example, you have a column for
  /// a button, you may want to not display anything in the heading of this
  /// column.
  ///
  /// The [BuildContext] and the [ColumnData] are provided by the builder.
  final Widget? Function(
    BuildContext context,
    ColumnData column,
  ) headingCellBuilder;

  /// A flag to display the loading widget or the loading indicator when data
  /// is loading.
  ///
  /// Turn on the flag when your data is loading and turn it off when the future
  /// is done.
  ///
  /// When there is no data in the table, the loading widget will be displayed
  /// instead of data rows.
  ///
  /// When there is data in the table, the loading indicator (above the table
  /// in the top-right corner) will be displayed.
  final bool isLoading;

  /// The callback to build each row cell.
  ///
  /// The [BuildContext], the [ColumnData] and the [index] of the row are
  /// provided by the builder.
  final Widget Function(
    BuildContext context,
    ColumnData column,
    int index,
  ) itemCellBuilder;

  /// The label to display in place of the data rows when there is no data.
  final String noDataLabel;

  /// The callback for when the items per page dropdown value change.
  ///
  /// It's useful only when the table has pagination. Defining the callback when
  /// there is no pagination has no effect.
  ///
  /// The new items per page value (the one newly selected with the dropdown) is
  /// provided by the callback, as well as the current page.
  final void Function(int page, int itemsPerPage)? onItemsPerPageChanged;

  /// The callback for when the next page will be displayed.
  ///
  /// It's useful only when the table has pagination. Defining the callback when
  /// there is no pagination has no effect.
  ///
  /// The new page value is provided by the callback, as well as the current
  /// items per page value. The page value is not an index, which means that the
  /// biggest value you can receive is [Paginated.pageCount] and not
  /// [Paginated.pageCount] - 1.
  ///
  /// For example, if the page was 2 before to tap the next page button, the
  /// page value provided by the callback will be 3.
  final void Function(int page, int itemsPerPage)? onNextPageTap;

  /// The callback for when the previous page will be displayed.
  ///
  /// It's useful only when the table has pagination. Defining the callback when
  /// there is no pagination has no effect.
  ///
  /// The previous page value is provided by the callback, as well as the
  /// current items per page value. The page value is not an index, which means
  /// that the lowest value you can receive is 1 and not 0.
  ///
  /// For example, if the page was 3 before to tap the previous page button, the
  /// page value provided by the callback will be 2.
  final void Function(int page, int itemsPerPage)? onPreviousPageTap;

  /// The callback for when a row has been dragged.
  ///
  /// It's useful only when the table has the flag [canDrag] enabled. Defining
  /// the callback when the dragging behavior is disabled has no effect.
  ///
  /// The old index (before the row has been dragged) and the new index (after
  /// the row has been dragged) are provided by the callback.
  final void Function(int oldIndex, int newIndex)? onRowDrag;

  /// The callback for when a row has been tapped.
  ///
  /// When not provided, the table doesn't allow any interaction when the data
  /// rows and disable any theme animation.
  ///
  /// The item of the tapped row is provided by the callback.
  final void Function(T item)? onRowTap;

  /// The pagination data required for the table to display a pagination row at
  /// its very bottom.
  ///
  /// When not provided, the table doesn't display a pagination row.
  ///
  /// You must provide:
  /// * [String] currentPageText: the text to display the current page. The text
  /// can be anything, but it must contain the "<current>" and the "<total>"
  /// tokens (without the quotation marks).
  /// * [String] itemsPerPageText: text to display the current items per page
  /// value. The text can be anything, but it must contain the "<count>" token
  /// (without the quotation marks). If the total count of items is lower than
  /// the current items per page value, it will display the total count of items
  /// instead.
  ///
  /// You can optionally provide:
  /// * [List<int>] itemsPerPageSuggestions: the suggestions to display in the
  /// items per page dropdown. By default, these suggestions are 5, 10, 25, 50
  /// and 100. The default value taken by the dropdown will be the middle value
  /// of the list of suggestions. For example, for 5, 10, 25, 50 and 100, the
  /// first value taken by the dropdown will be 25. Another example: for 5, 10,
  /// 20, 50, 100, 200, 500 and 1000, the first value taken by the dropdown will
  /// be 100.
  /// /// * [Paginated<T>] paginated: the data to display in the table with the
  /// current pagination configuration. If no data is provided, the table will
  /// display a [noDataLabel] message instead.
  final PaginationData<T>? pagination;

  /// The callback for when a row is actually determining if it should display a
  /// theme animation or not.
  ///
  /// When [onRowTap] is not provided, the callback has not effect.
  ///
  /// If you always want rows to display a theme animation, don't provide the
  /// callback or always return true.
  ///
  /// If you want a row to not display a theme animation under some conditions,
  /// use this callback to return false or true depending on these conditions.
  ///
  /// The [index] of the row is provided by the callback.
  ///
  /// This callback can be useful if, for example, you don't want to display a
  /// hover animation on a row when hovering a button inside this row.
  final bool Function(int index)? shouldShowOverlayColor;

  const MaterialScrollableTable({
    this.canDrag = false,
    required this.columns,
    required this.headingCellBuilder,
    this.isLoading = false,
    this.items = const [],
    required this.itemCellBuilder,
    required this.noDataLabel,
    this.onItemsPerPageChanged,
    this.onNextPageTap,
    this.onPreviousPageTap,
    this.onRowDrag,
    this.onRowTap,
    this.pagination,
    this.shouldShowOverlayColor,
    super.key,
  });

  /// A getter for the state of the table.
  ///
  /// It will return the state or null depending if a [MaterialScrollableTable]
  /// ancestor has been found or not.
  static MaterialScrollableTableState<T>? maybeOf<T>(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_Inherited<T>>();
    return inherited?.state;
  }

  /// A getter for the state of the table.
  ///
  /// It will return the state if a [MaterialScrollableTable] ancestor has been
  /// found.
  ///
  /// It will throw a [StateError] if no [MaterialScrollableTable] ancestor has
  /// been found.
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

/// State of the [MaterialScrollableTable].
class MaterialScrollableTableState<T>
    extends State<MaterialScrollableTable<T>> {
  static const _listEquality = ListEquality();

  /// A list of flags that keeps the draggable state of each row.
  ///
  /// This list is always sync with the list of items currently displayed, even
  /// after a dragging gesture.
  final isRowDragging = <bool>[];

  final _key = GlobalKey();

  var _currentlyDraggedRowOffset = Offset.zero;
  var _currentRowIndex = -1;
  var _itemsBeforeDrag = <T>[];
  var _items = <T>[];
  var _startRowIndex = -1;

  /// The width of the table.
  double? get width {
    return _key.widgetBounds?.width;
  }

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
                feedback: _getRow(
                  item,
                  index,
                  withTableKey: true,
                ),
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

  Widget _getRow(T item, int index, {bool withTableKey = false}) {
    return ItemRow(
      canDrag: widget.canDrag,
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
      tableKey: () {
        if (withTableKey) {
          return _key;
        }
        return null;
      }(),
    );
  }

  _onItemsChange() {
    _items = widget.pagination?.paginated?.data ?? widget.items;
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
    final areItemsEqual = _listEquality.equals(oldWidget.items, widget.items);
    final arePaginatedEqual = _listEquality.equals(
      oldWidget.pagination?.paginated?.data,
      widget.pagination?.paginated?.data,
    );
    if (!areItemsEqual || !arePaginatedEqual) {
      isRowDragging.clear();
      _onItemsChange();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _Inherited<T>(
      state: this,
      child: Column(
        children: [
          Conditional(
            conditions: [
              widget.isLoading && _items.isNotEmpty,
            ],
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  bottom: 4,
                  right: 24,
                ),
                child: const LoadingIndicator(),
              ),
              const SizedBox(
                height: LoadingIndicator.size + 4,
              ),
            ],
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              key: _key,
              child: Column(
                children: [
                  HeadingRow(
                    cellBuilder: widget.headingCellBuilder,
                    columns: widget.columns,
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (widget.isLoading && _items.isEmpty) {
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
                                builder: (context, acceptedData, rejectedData) {
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
                  Builder(
                    builder: (context) {
                      final pagination = widget.pagination;
                      if (pagination != null) {
                        return PaginationRow(
                          onItemsPerPageChanged: widget.onItemsPerPageChanged,
                          onNextPageTap: widget.onNextPageTap,
                          onPreviousPageTap: widget.onPreviousPageTap,
                          pagination: pagination,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
