import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  final Widget? child;
  final MaterialScrollableTableDecoration decoration;

  const LoadingBody({
    required this.decoration,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<MaterialScrollableTableThemeData>();
    final color = decoration.loadingWidgetColor ??
        theme?.loadingWidgetColor ??
        Theme.of(context).colorScheme.onSurfaceVariant;
    final padding = decoration.rowPadding ??
        decoration.padding ??
        theme?.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
        );
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: padding.horizontal / 2,
        vertical: padding.vertical == 0
            ? padding.horizontal / 2
            : padding.vertical / 2,
      ),
      child: child ??
          Loading(
            color: color,
          ),
    );
  }
}
