import 'package:apollocode_flutter_utilities/widgets/icons/error_icon.dart';
import 'package:apollocode_flutter_utilities/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

class NoDataBody extends StatelessWidget {
  final String labelText;

  const NoDataBody({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final label = BodyText(
      labelText,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
    final labelStyle = label.getStyle(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ErrorIcon(
            color: Theme.of(context).colorScheme.error,
            constraints: BoxConstraints.tight(
              Size.square(
                labelStyle?.realHeight as double,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: label,
          ),
        ],
      ),
    );
  }
}
