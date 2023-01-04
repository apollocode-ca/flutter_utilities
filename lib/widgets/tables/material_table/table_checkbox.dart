import 'package:flutter/material.dart';

class TableCheckbox extends StatelessWidget {
  final bool? checkboxValue;
  final void Function(bool? value) onCheckboxTap;

  const TableCheckbox({
    required this.checkboxValue,
    required this.onCheckboxTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.primaryContainer;
        }
        return null;
      }),
      checkColor: Theme.of(context).colorScheme.onPrimaryContainer,
      onChanged: onCheckboxTap,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return onPrimary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return onPrimary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return onPrimary.withOpacity(0.08);
        }
        return null;
      }),
      tristate: true,
      value: checkboxValue,
    );
  }
}
