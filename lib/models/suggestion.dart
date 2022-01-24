class Suggestion {
  String? id;
  String? type;
  String? text;
  String? highlight;
  String? description;

  Suggestion({this.type, this.id, this.text, this.highlight, this.description});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
        type: (json['Type'] != null) ? json['Type']!.toString() : '',
        id: (json['Id'] != null) ? json['Id']!.toString() : '',
        text: (json['Text'] != null) ? json['Text']!.toString() : '',
        highlight: (json['Highlight'] != null) ? json['Highlight']!.toString() : '',
        description:
            (json['Description'] != null) ? json['Description']!.toString() : '');
  }

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      'Id': id,
      'Text': text,
      'Highlight': highlight,
      'Description': description,
    };
  }
}
