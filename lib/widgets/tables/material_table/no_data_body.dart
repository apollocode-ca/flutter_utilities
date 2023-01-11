import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/error_icon.dart';
import 'package:apollocode_flutter_utilities/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

class NoDataBody extends StatelessWidget {
  final MaterialScrollableTableDecoration decoration;
  final Widget? icon;
  final String labelText;

  const NoDataBody({
    required this.decoration,
    required this.icon,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<MaterialScrollableTableThemeData>();
    final textColor = decoration.emptyTableTextStyle?.color ??
        decoration.oddRowForegroundColor ??
        theme?.oddRowForegroundColor ??
        Theme.of(context).colorScheme.onSurfaceVariant;
    final textStyle = decoration.emptyTableTextStyle?.copyWith(
          color: textColor,
        ) ??
        decoration.oddRowTextStyle?.copyWith(
          color: textColor,
        ) ??
        decoration.rowTextStyle?.copyWith(
          color: textColor,
        ) ??
        theme?.rowTextStyle.copyWith(
          color: textColor,
        ) ??
        TextStyle(
          color: textColor,
        );
    final label = BodyText(
      labelText,
      style: textStyle,
    );
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ??
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: ErrorIcon(
                  color: Theme.of(context).colorScheme.error,
                  constraints: BoxConstraints.tightFor(
                    height: label.getStyle(context)?.realHeight,
                    width: label.getStyle(context)?.realHeight,
                  ),
                ),
              ),
          label,
        ],
      ),
    );
  }
}
