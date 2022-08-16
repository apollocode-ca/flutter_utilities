import 'package:apollocode_flutter_utilities/errors/i10n_error.dart';

String getNullSafeLabel(String? label, String labelName, String locale) {
  if (label != null) {
    return label;
  }
  throw I10nError(
    labelName: labelName,
    locale: locale,
  );
}
