import 'package:flutter/material.dart';

class DropdownSuggestion<T> extends StatefulWidget {
  final Size fieldSize;
  final bool hasFocus;
  final void Function(T suggestion) onChange;
  final T suggestion;
  final Widget Function(BuildContext context, T suggestion) suggestionBuilder;

  const DropdownSuggestion({
    required this.fieldSize,
    required this.hasFocus,
    required this.onChange,
    required this.suggestion,
    required this.suggestionBuilder,
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownSuggestion<T>> createState() => _State<T>();
}

class _State<T> extends State<DropdownSuggestion<T>> {
  Color? decorationColor;
  Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    final labelStyle =
        Theme.of(context).inputDecorationTheme.labelStyle ?? const TextStyle();
    if (widget.hasFocus) {
      final onSurface = Theme.of(context).colorScheme.onSurface;
      decorationColor = onSurface;
      overlayColor = onSurface.withOpacity(0.12);
    }
    return GestureDetector(
      onTap: () {
        widget.onChange(widget.suggestion);
      },
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        onEnter: (event) {
          if (!widget.hasFocus) {
            final onSurface = Theme.of(context).colorScheme.onSurface;
            setState(() {
              decorationColor = onSurface;
              overlayColor = onSurface.withOpacity(0.08);
            });
          }
        },
        onExit: (event) {
          if (!widget.hasFocus) {
            setState(() {
              decorationColor = null;
              overlayColor = null;
            });
          }
        },
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints.tightFor(
            height: widget.fieldSize.height,
          ),
          decoration: BoxDecoration(
            color: overlayColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: DefaultTextStyle(
            style: labelStyle.copyWith(
              color: decorationColor,
            ),
            child: widget.suggestionBuilder(context, widget.suggestion),
          ),
        ),
      ),
    );
  }
}
