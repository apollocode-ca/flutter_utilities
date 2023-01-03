import 'package:live_tester/src/configs/beamer_delegates/main_delegate.dart';
import 'package:live_tester/src/configs/theme_provider.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:live_tester/src/utilities/l10n_provider.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LiveTesterApp extends StatelessWidget {
  const LiveTesterApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: mainDelegate,
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: L10nProvider.localizationsDelegates,
      routerDelegate: mainDelegate,
      routeInformationParser: BeamerParser(),
      supportedLocales: L10nProvider.supportedLocales,
      builder: (context, child) {
        L10nProvider.initialize(context);
        FigmaManager.initialize(context);
        L10nProvider.addDescriptionMetadata();
        L10nProvider.addTitleMetadata();
        if (child != null) {
          final themeProvider = ThemeProvider();
          return Theme(
            data: themeProvider.getFrom(
              Brightness.light,
            ),
            child: child,
          );
        }
        return Container();
      },
    );
  }
}
