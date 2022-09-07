class ResponsiveError extends Error {
  static const errorMessage = 'There is no actual design for the "<type>" '
      'media size. Please add one to use the responsive helper.';

  final _ResponsiveErrorType type;

  factory ResponsiveError.noDesktop() {
    return ResponsiveError._(_ResponsiveErrorType.noDesktop);
  }

  factory ResponsiveError.noMobile() {
    return ResponsiveError._(_ResponsiveErrorType.noMobile);
  }

  ResponsiveError._(this.type);

  String get _type {
    if (type == _ResponsiveErrorType.noDesktop) {
      return 'desktop';
    }
    return 'mobile';
  }

  @override
  String toString() {
    return errorMessage.replaceAll('<type>', _type);
  }
}

enum _ResponsiveErrorType {
  noDesktop,
  noMobile,
}
