import 'package:flutter/material.dart';
import 'package:yourhome_web/utils/router_names.dart';
import 'package:yourhome_web/screen/home/view/home_screen.dart';
import 'package:yourhome_web/screen/login/view/login_screen.dart';
import 'package:yourhome_web/screen/signup/view/signup_screen.dart';
import 'package:yourhome_web/screen/landing/view/landing_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.homeScreen: (context) => const HomeScreen(),
  RouteNames.loginScreen: (context) => const LoginScreen(),
  RouteNames.signUpScreen: (context) => const SignUpScreen(),
  RouteNames.landingScreen: (context) => const LandingScreen(),
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
    case RouteNames.signUpScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignUpScreen(),
      );
    case RouteNames.homeScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingScreen(),
      );
  }
}