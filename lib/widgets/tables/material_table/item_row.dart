import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/widgets/tables/material_table/table_cell.dart';
import 'package:flutter/material.dart' hide TableCell;

class ItemRow<T> extends StatefulWidget {
  final Widget Function(
    ColumnData column,
    int index,
    TextStyle currentTextStyle,
  ) cellBuilder;
  final List<ColumnData> columns;
  final int index;
  final T item;
  final void Function(T item)? onTap;
  final bool shouldShowOverlayColor;

  const ItemRow({
    required this.cellBuilder,
    required this.columns,
    required this.index,
    required this.item,
    this.onTap,
    this.shouldShowOverlayColor = true,
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (details) {
        setState(() {
          isPressing = true;
        });
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
      },
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
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
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          duration: kThemeChangeDuration,
          foregroundDecoration: BoxDecoration(
            color: () {
              if (widget.shouldShowOverlayColor) {
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
          child: Row(
            children: [
              ...widget.columns.map((column) {
                if (column.width == null) {
                  return Expanded(
                    child: TableCell(
                      column: column,
                      child: widget.cellBuilder(
                        column,
                        widget.index,
                        TextStyle(
                          color: foregroundColor,
                        ),
                      ),
                    ),
                  );
                }
                return TableCell(
                  column: column,
                  child: widget.cellBuilder(
                    column,
                    widget.index,
                    TextStyle(
                      color: foregroundColor,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
