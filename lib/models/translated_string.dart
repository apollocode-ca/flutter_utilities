
class TranslatedString {
  Map<String, String> translations = {};

  TranslatedString(this.translations);

  factory TranslatedString.fromJson(Map<String, dynamic> json) {
    return TranslatedString(json.cast<String, String>());
  }

  Map<String, dynamic> toJson() => translations.cast<String, dynamic>();
}
