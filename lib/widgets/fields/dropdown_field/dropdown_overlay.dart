import 'package:apollocode_flutter_utilities/widgets/fields/dropdown_field/dropdown_suggestion.dart';
import 'package:flutter/material.dart';

class DropdownOverlay<T> extends StatelessWidget {
  final Size? fieldSize;
  final int focusedSuggestionIndex;
  final LayerLink link;
  final void Function(T suggestion) onChange;
  final Widget Function(BuildContext context, T suggestion) suggestionBuilder;
  final List<T> suggestions;

  const DropdownOverlay({
    this.fieldSize,
    required this.focusedSuggestionIndex,
    required this.link,
    required this.onChange,
    required this.suggestionBuilder,
    required this.suggestions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldSize = this.fieldSize;
    if (fieldSize == null) {
      return Container();
    }
    final theme = Theme.of(context).inputDecorationTheme;
    final enabledBorder = theme.enabledBorder as OutlineInputBorder;
    return Positioned(
      width: fieldSize.width,
      child: CompositedTransformFollower(
        link: link,
        offset: Offset(0, fieldSize.height + 5),
        showWhenUnlinked: false,
        child: Container(
          constraints: BoxConstraints.tightFor(
            width: fieldSize.width,
          ),
          decoration: BoxDecoration(
            borderRadius: enabledBorder.borderRadius,
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.38),
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Builder(
            builder: (context) {
              var index = -1;
              return Column(
                children: suggestions.map((suggestion) {
                  index++;
                  return DropdownSuggestion(
                    key: ValueKey(index),
                    fieldSize: fieldSize,
                    hasFocus: focusedSuggestionIndex == index,
                    onChange: onChange,
                    suggestion: suggestion,
                    suggestionBuilder: suggestionBuilder,
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
