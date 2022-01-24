import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  const LoadingScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Loading(),
    ));
  }
}
