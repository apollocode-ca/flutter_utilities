class I10nError extends Error {
  final String labelName;
  final String locale;

  I10nError({
    required this.labelName,
    required this.locale,
  });

  @override
  String toString() {
    return 'The label "$labelName" has not been defined in the '
        '"app_$locale.arb" file.';
  }
}
