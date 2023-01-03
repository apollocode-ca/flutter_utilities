import 'package:live_tester/src/layouts/dashboard_layout.dart';
import 'package:live_tester/src/layouts/dashboard_layout/pages/home_page.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

final mainDelegate = BeamerDelegate(
  initialPath: '/',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) {
        return BeamPage(
          key: ValueKey(state.uri),
          title: 'Live Tester - Home',
          type: BeamPageType.fadeTransition,
          child: const DashboardLayout(
            child: HomePage(),
          ),
        );
      },
    },
  ),
);
