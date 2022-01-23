import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "404",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Not found.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.normal),
            ),
            Icon(
              Icons.not_listed_location_outlined,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        )));
  }
}
