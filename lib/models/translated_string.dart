
class TranslatedString {
  String? fr;
  String? en;
  get string => (String lang) {
    if (lang.contains(lang)) {
      return fr;
    } 

    return en;
  };

  TranslatedString({this.fr, this.en});

  factory TranslatedString.fromJson(Map<String, dynamic> json) {
    return TranslatedString(
        fr: json['fr']?.toString(), en: json['en']?.toString());
  }

  Map<String, dynamic> toJson() => {'fr': fr, 'en': en};
}
