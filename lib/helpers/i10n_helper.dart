import 'package:apollocode_flutter_utilities/errors/i10n_error.dart';

class I10nHelper {
  static late final I10nHelper _instance;
  static var _isInitialized = false;

  static I10nHelper get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'I10nHelper must be initialized before to get an instance.',
    );
  }

  static void initialize(String locale) {
    _instance = I10nHelper._(locale);
    _isInitialized = true;
  }

  late final String _locale;

  I10nHelper._(String locale) {
    _locale = locale;
  }

  String getLabel(String? label, String labelName) {
    if (label != null) {
      return label;
    }
    throw I10nError(
      labelName: labelName,
      locale: _locale,
    );
  }
}
