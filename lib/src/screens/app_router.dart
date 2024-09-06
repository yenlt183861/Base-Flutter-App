// ignore_for_file: constant_identifier_names

import 'package:base_flutter_app/src/screens/barrel_screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String HOME_SCREEN = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
