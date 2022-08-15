import 'package:universal_html/html.dart';

void addDescriptionMetadata(String description) {
  document.head?.children.removeWhere((element) {
    if (element is MetaElement) {
      return element.name == 'description';
    }
    return false;
  });
  final metaElement = MetaElement();
  metaElement.name = 'description';
  metaElement.content = description;
  document.head?.append(metaElement);
}
