import 'package:apollocode_flutter_utilities/extensions/global_key_extension.dart';
import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_checkbox.dart';
import 'package:flutter/material.dart' hide TableCell;

class ItemRow<T> extends StatefulWidget {
  final bool addCheckboxesColumn;
  final bool canDrag;
  final Widget Function(
    BuildContext context,
    ColumnData column,
    int index,
  ) cellBuilder;
  final List<ColumnData> columns;
  final int index;
  final bool isAnyRowDragging;
  final bool isDragging;
  final T item;
  final void Function(T item)? onTap;
  final bool shouldShowOverlayColor;
  final GlobalKey? tableKey;

  const ItemRow({
    required this.addCheckboxesColumn,
    this.canDrag = false,
    required this.cellBuilder,
    required this.columns,
    required this.index,
    this.isAnyRowDragging = false,
    this.isDragging = false,
    required this.item,
    this.onTap,
    this.shouldShowOverlayColor = true,
    this.tableKey,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemRow<T>> createState() => _State<T>();
}

class _State<T> extends State<ItemRow<T>> {
  var isHovering = false;
  var isPressing = false;

  Color get backgroundColor {
    if (widget.index.isOdd) {
      return Theme.of(context).colorScheme.surface;
    }
    return Theme.of(context).colorScheme.surfaceVariant;
  }

  Color get draggedColor {
    if (widget.index.isOdd) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.16);
    }
    return Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.16);
  }

  Color get foregroundColor {
    if (widget.index.isOdd) {
      return Theme.of(context).colorScheme.onSurface;
    }
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }

  Color get hoveredColor {
    if (widget.index.isOdd) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.08);
    }
    return Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.08);
  }

  Color get pressedColor {
    if (widget.index.isOdd) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    }
    return Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.12);
  }

  @override
  void didUpdateWidget(covariant ItemRow<T> oldWidget) {
    if (widget.isAnyRowDragging) {
      isHovering = false;
      isPressing = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDragging && widget.tableKey == null) {
      return MouseRegion(
        cursor: SystemMouseCursors.grabbing,
        child: Container(
          constraints: BoxConstraints.tightFor(
            height: Theme.of(context).dataTableTheme.dataRowHeight,
            width: widget.tableKey?.widgetBounds?.width,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
        ),
      );
    }
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        setState(() {
          isPressing = false;
        });
      },
      onLongPressDown: (details) {
        if (widget.shouldShowOverlayColor && !widget.isAnyRowDragging) {
          setState(() {
            isPressing = true;
          });
        }
      },
      onLongPressUp: () {
        setState(() {
          isPressing = false;
        });
      },
      onTap: () {
        final onTap = widget.onTap;
        if (onTap != null) {
          onTap(widget.item);
        }
        setState(() {
          isPressing = false;
        });
      },
      child: MouseRegion(
        cursor: () {
          if (widget.onTap == null && !widget.canDrag) {
            return MouseCursor.defer;
          }
          if (widget.isAnyRowDragging) {
            return SystemMouseCursors.grabbing;
          }
          return MaterialStateMouseCursor.clickable;
        }(),
        onEnter: (event) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovering = false;
          });
        },
        child: AnimatedContainer(
          constraints: BoxConstraints.tightFor(
            height: Theme.of(context).dataTableTheme.dataRowHeight,
            width: widget.tableKey?.widgetBounds?.width,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          duration: kThemeChangeDuration,
          foregroundDecoration: BoxDecoration(
            color: () {
              if (widget.onTap == null && !widget.canDrag) {
                return null;
              }
              if (widget.isDragging) {
                return draggedColor;
              }
              if (widget.shouldShowOverlayColor && !widget.isAnyRowDragging) {
                if (isPressing) {
                  return pressedColor;
                }
                if (isHovering) {
                  return hoveredColor;
                }
              }
              return null;
            }(),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Builder(
            builder: (context) {
              final cells = <Widget>[];
              if (widget.addCheckboxesColumn) {
                cells.add(
                  TableCell(
                    alignment: Alignment.center,
                    width: 32,
                    child: TableCheckbox(
                      checkboxValue: false,
                      onCheckboxTap: (value) {},
                    ),
                  ),
                );
              }
              for (var index = 0; index < widget.columns.length; index++) {
                final column = widget.columns[index];
                if (column.width == null) {
                  cells.add(
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: foregroundColor,
                        ),
                        textAlign: column.textAlign,
                        child: TableCell(
                          column: column,
                          shouldApplyMargin:
                              index != 0 || widget.addCheckboxesColumn,
                          child: widget.cellBuilder(
                            context,
                            column,
                            widget.index,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  cells.add(
                    DefaultTextStyle(
                      style: TextStyle(
                        color: foregroundColor,
                      ),
                      textAlign: column.textAlign,
                      child: TableCell(
                        column: column,
                        shouldApplyMargin:
                            index != 0 || widget.addCheckboxesColumn,
                        child: widget.cellBuilder(
                          context,
                          column,
                          widget.index,
                        ),
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
        ),
      ),
    );
  }
}
