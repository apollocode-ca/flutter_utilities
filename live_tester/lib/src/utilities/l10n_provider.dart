import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:universal_html/html.dart';

class L10nProvider {
  static late final AppLocalizations _instance;
  static var _isInitialized = false;

  static AppLocalizations get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'L10nProvider must be initialized before to get an instance.',
    );
  }

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }

  static List<Locale> get supportedLocales {
    return AppLocalizations.supportedLocales;
  }

  static void addDescriptionMetadata() {
    document.head?.children.removeWhere((element) {
      if (element is MetaElement) {
        return element.name == 'description';
      }
      return false;
    });
    final metaElement = MetaElement();
    metaElement.name = 'description';
    metaElement.content = 'App on which devs can easily test widgets and other '
        'utilities created in the apollocode_flutter_utilities package';
    document.head?.append(metaElement);
  }

  static void addTitleMetadata() {
    document.head?.children.removeWhere((element) {
      if (element is MetaElement) {
        return element.name == 'title';
      }
      return false;
    });
    final metaElement = MetaElement();
    metaElement.name = 'title';
    metaElement.content = 'Live Tester';
    document.head?.append(metaElement);
  }

  static void initialize(BuildContext context) {
    if (!_isInitialized) {
      _instance = _getLocalizations(context);
      _isInitialized = true;
    }
  }

  static AppLocalizations _getLocalizations(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations != null) {
      return localizations;
    }
    throw StateError(
      "L10nProvider can't be initialized because there is no localizations "
      'from which to initialize the provider.',
    );
  }
}
