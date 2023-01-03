import 'package:apollocode_flutter_utilities/widgets/texts/display_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(),
      child: const DisplayText('TEMPLATE'),
    );
  }
}
