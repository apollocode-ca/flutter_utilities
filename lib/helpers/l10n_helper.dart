import 'package:apollocode_flutter_utilities/errors/l10n_error.dart';

class L10nHelper {
  static late final L10nHelper _instance;
  static var _isInitialized = false;

  static L10nHelper get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'I10nHelper must be initialized before to get an instance.',
    );
  }

  static void initialize(String locale) {
    if (!_isInitialized) {
      _instance = L10nHelper._(locale);
      _isInitialized = true;
    }
  }

  late final String _locale;

  L10nHelper._(String locale) {
    _locale = locale;
  }

  String getLabel(String? label, String labelName) {
    if (label != null) {
      return label;
    }
    throw L10nError(
      labelName: labelName,
      locale: _locale,
    );
  }
}
