// routes.dart
import 'package:flutter/material.dart';
import 'package:yourhome_web/utils/router_names.dart';
import 'package:yourhome_web/screen/landing/view/landing_screen.dart';
import 'package:yourhome_web/screen/login/view/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.landingScreen: (context) => const LandingScreen(),
  RouteNames.loginScreen: (context) => const LoginScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.landingScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingScreen(),
      );
    case RouteNames.loginScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingScreen(),
      );
  }
}