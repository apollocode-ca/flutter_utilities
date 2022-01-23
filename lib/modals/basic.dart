import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class BasicModal extends StatelessWidget {
  final String title;
  final String message;
  final String closeString;

  const BasicModal(this.title, this.message, {Key? key, this.closeString = "Fermer"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 21),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        width: (MediaQuery.of(context).size.width < 450) ? 300 : 450,
        height: 150,
        child: HtmlWidget(
          message,
          textStyle: const TextStyle(fontSize: 17),
          onTapUrl: (url) {
            launch(url);
            return true;
          },
        ),
      ),
      actionsPadding: const EdgeInsets.all(24),
      actions: [
        TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              closeString,
              style: const TextStyle(fontSize: 16),
            ))
      ],
    );
  }
}
