class I10nException implements Exception {
  final String labelName;
  final String locale;

  I10nException({
    required this.labelName,
    required this.locale,
  });

  @override
  String toString() {
    return 'The label "$labelName" has not been defined in the '
        '"app_$locale.arb" file.';
  }
}
