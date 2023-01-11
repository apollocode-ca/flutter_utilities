import 'package:apollocode_flutter_utilities/enums/checkbox_state.dart';
import 'package:apollocode_flutter_utilities/widgets/togglables/material_checkbox.dart';
import 'package:flutter/material.dart';

class TableCheckbox extends StatelessWidget {
  final bool disabled;
  final bool? isEvenRow;
  final void Function(CheckboxState state)? onChanged;
  final void Function() onTap;
  final CheckboxState state;

  const TableCheckbox({
    this.disabled = false,
    required this.isEvenRow,
    required this.onChanged,
    required this.onTap,
    required this.state,
    super.key,
  });

  Color _getBackgroundColor(BuildContext context) {
    final isEvenRow = this.isEvenRow;
    if (isEvenRow == null) {
      return Theme.of(context).colorScheme.onPrimary;
    }
    if (isEvenRow) {
      return Theme.of(context).colorScheme.onSurfaceVariant;
    }
    return Theme.of(context).colorScheme.onSurface;
  }

  Color _getBorderColor(Set<MaterialState> states, BuildContext context) {
    final color = _getBackgroundColor(context);
    if (states.contains(MaterialState.disabled)) {
      return color.withOpacity(0.38);
    }
    return color;
  }

  Color _getForegroundColor(BuildContext context) {
    final isEvenRow = this.isEvenRow;
    if (isEvenRow == null) {
      return Theme.of(context).colorScheme.primary;
    }
    if (isEvenRow) {
      return Theme.of(context).colorScheme.surfaceVariant;
    }
    return Theme.of(context).colorScheme.surface;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialCheckbox(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        final color = _getBackgroundColor(context);
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return color.withOpacity(0.38);
          }
          return color;
        }
        return null;
      }),
      border: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return null;
        }
        return Border.all(
          color: _getBorderColor(states, context),
          width: 2,
        );
      }),
      disabled: disabled,
      foregroundColor: MaterialStatePropertyAll(
        _getForegroundColor(context),
      ),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        final color = _getBackgroundColor(context);
        if (states.contains(MaterialState.pressed)) {
          return color.withOpacity(0.12);
        }
        if (states.contains(MaterialState.focused)) {
          return color.withOpacity(0.12);
        }
        if (states.contains(MaterialState.hovered)) {
          return color.withOpacity(0.08);
        }
        return null;
      }),
      onChanged: onChanged,
      onTap: onTap,
      state: state,
      tristate: isEvenRow == null,
    );
  }
}
