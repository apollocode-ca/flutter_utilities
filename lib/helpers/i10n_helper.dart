import 'package:apollocode_flutter_utilities/exceptions/i10n_exception.dart';

String getNullSafeLabel(String? label, String labelName, String locale) {
  if (label != null) {
    return label;
  }
  throw I10nException(
    labelName: labelName,
    locale: locale,
  );
}
