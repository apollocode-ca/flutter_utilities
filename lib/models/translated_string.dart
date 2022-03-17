class TranslatedString {
  Map<String, String?> _translations = {};

  TranslatedString(this._translations);

  factory TranslatedString.fromJson(Map<String, dynamic> json) {
    return TranslatedString(json.cast<String, String?>());
  }

  // String string(String lang) {
//
  // }

  String? operator [](String languageCode) {
    String? translation = _translations[languageCode];

    if (translation == null && languageCode.contains('_')) {
      translation = _translations[languageCode.split('_')[0]];
    }

    if (translation == null && _translations['en'] != null) {
      translation = _translations['en'];
    }

    if (translation == null && _translations['en_ca'] != null) {
      translation = _translations['en_ca'];
    }

    if (translation == null) {
      _translations.forEach((key, value) {
        if (value != null) {
          translation = value;
        }
      });
    }

    return languageCode;
  }

  void operator []=(String languageCode, String? value) {
    _translations[languageCode] = value;
  }

  Map<String, dynamic> toJson() => _translations.cast<String, dynamic>();
}
