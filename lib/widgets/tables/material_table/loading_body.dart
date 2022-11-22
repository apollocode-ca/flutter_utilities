import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Loading(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
