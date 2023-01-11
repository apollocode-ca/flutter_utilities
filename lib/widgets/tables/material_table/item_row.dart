import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/enums/checkbox_state.dart';
import 'package:apollocode_flutter_utilities/extensions/global_key_extension.dart';
import 'package:apollocode_flutter_utilities/models/column_data.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
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
  final CheckboxState checkboxState;
  final List<ColumnData> columns;
  final MaterialScrollableTableDecoration decoration;
  final int index;
  final bool isAnyRowDragging;
  final bool isDragging;
  final T item;
  final void Function(CheckboxState state) onCheckboxChanged;
  final void Function() onCheckboxTap;
  final void Function(T item)? onTap;
  final bool shouldShowOverlayColor;
  final GlobalKey? tableKey;

  const ItemRow({
    required this.addCheckboxesColumn,
    this.canDrag = false,
    required this.cellBuilder,
    required this.checkboxState,
    required this.columns,
    required this.decoration,
    required this.index,
    this.isAnyRowDragging = false,
    this.isDragging = false,
    required this.item,
    required this.onCheckboxChanged,
    required this.onCheckboxTap,
    required this.onTap,
    this.shouldShowOverlayColor = true,
    this.tableKey,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemRow<T>> createState() => _State<T>();
}

class _State<T> extends State<ItemRow<T>> {
  var isHovering = false;
  var isHoveringCheckbox = false;
  var isPressing = false;

  Color get backgroundColor {
    final number = widget.index + 1;
    if (number.isOdd) {
      return widget.decoration.oddRowBackgroundColor ??
          theme?.oddRowBackgroundColor ??
          Theme.of(context).colorScheme.surfaceVariant;
    }
    return widget.decoration.evenRowBackgroundColor ??
        theme?.evenRowBackgroundColor ??
        Theme.of(context).colorScheme.surface;
  }

  Color get draggedColor {
    return foregroundColor.withOpacity(0.16);
  }

  Color get foregroundColor {
    final number = widget.index + 1;
    if (number.isOdd) {
      return widget.decoration.oddRowForegroundColor ??
          theme?.oddRowForegroundColor ??
          Theme.of(context).colorScheme.onSurfaceVariant;
    }
    return widget.decoration.evenRowForegroundColor ??
        theme?.evenRowForegroundColor ??
        Theme.of(context).colorScheme.onSurface;
  }

  Color get hoveredColor {
    return foregroundColor.withOpacity(0.08);
  }

  Color get pressedColor {
    return foregroundColor.withOpacity(0.12);
  }

  double get rowHeight {
    final rowHeight = widget.decoration.rowHeight;
    if (rowHeight != null) {
      return rowHeight;
    }
    return theme?.rowHeight ?? 52;
  }

  bool get shouldShowOverlayColor {
    return widget.shouldShowOverlayColor &&
        !isHoveringCheckbox &&
        !widget.isAnyRowDragging;
  }

  Color get textColor {
    final number = widget.index + 1;
    if (number.isOdd) {
      return widget.decoration.oddRowTextStyle?.color ??
          widget.decoration.rowTextStyle?.color ??
          foregroundColor;
    }
    return widget.decoration.evenRowTextStyle?.color ??
        widget.decoration.rowTextStyle?.color ??
        foregroundColor;
  }

  TextStyle get textStyle {
    final number = widget.index + 1;
    if (number.isOdd) {
      return widget.decoration.oddRowTextStyle?.copyWith(
            color: textColor,
          ) ??
          widget.decoration.rowTextStyle?.copyWith(
            color: textColor,
          ) ??
          theme?.rowTextStyle.copyWith(
            color: textColor,
          ) ??
          const TextStyle();
    }
    return widget.decoration.evenRowTextStyle?.copyWith(
          color: textColor,
        ) ??
        widget.decoration.rowTextStyle?.copyWith(
          color: textColor,
        ) ??
        theme?.rowTextStyle.copyWith(
          color: textColor,
        ) ??
        const TextStyle();
  }

  MaterialScrollableTableThemeData? get theme {
    return Theme.of(context).extension<MaterialScrollableTableThemeData>();
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
    final animationDuration = widget.decoration.animationDuration ??
        theme?.animationDuration ??
        kThemeAnimationDuration;
    final checkboxColumnAlignment = widget.decoration.checkboxColumnAlignment ??
        theme?.checkboxColumnAlignment ??
        AlignmentDirectional.center;
    final checkboxColumnWidth = widget.decoration.checkboxColumnWidth ??
        theme?.checkboxColumnWidth ??
        48;
    final padding = widget.decoration.rowPadding ??
        widget.decoration.padding ??
        theme?.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
        );
    if (widget.isDragging && widget.tableKey == null) {
      return MouseRegion(
        cursor: SystemMouseCursors.grabbing,
        child: Container(
          constraints: BoxConstraints.tightFor(
            height: rowHeight,
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
        if (shouldShowOverlayColor) {
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
            height: rowHeight,
            width: widget.tableKey?.widgetBounds?.width,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          duration: animationDuration,
          foregroundDecoration: BoxDecoration(
            color: () {
              if (widget.onTap == null && !widget.canDrag) {
                return null;
              }
              if (widget.isDragging) {
                return draggedColor;
              }
              if (shouldShowOverlayColor) {
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
          padding: padding,
          child: Builder(
            builder: (context) {
              final cells = <Widget>[];
              if (widget.addCheckboxesColumn) {
                cells.add(
                  TableCell(
                    alignment: checkboxColumnAlignment,
                    decoration: widget.decoration,
                    width: checkboxColumnWidth,
                    child: TableCheckbox(
                      isEvenRow: widget.index.isEven,
                      onChanged: widget.onCheckboxChanged,
                      onHovered: (isHovering) {
                        setState(() {
                          isHoveringCheckbox = isHovering;
                        });
                      },
                      onTap: widget.onCheckboxTap,
                      state: widget.checkboxState,
                    ),
                  ),
                );
              }
              for (var index = 0; index < widget.columns.length; index++) {
                final column = widget.columns[index];
                final shouldApplyMargin =
                    index != 0 || widget.addCheckboxesColumn;
                if (column.width == null) {
                  cells.add(
                    Expanded(
                      child: DefaultTextStyle(
                        style: textStyle,
                        textAlign: column.textAlign,
                        child: TableCell(
                          column: column,
                          decoration: widget.decoration,
                          shouldApplyMargin: shouldApplyMargin,
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
                      style: textStyle,
                      textAlign: column.textAlign,
                      child: TableCell(
                        column: column,
                        decoration: widget.decoration,
                        shouldApplyMargin: shouldApplyMargin,
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
