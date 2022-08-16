class ThemeExtensionError extends Error {
  final Type extensionType;

  ThemeExtensionError({
    required this.extensionType,
  });

  @override
  String toString() {
    return "Theme extension \"$extensionType\" doesn't exist, but needs to be "
        'defined to properly use the theme.';
  }
}
