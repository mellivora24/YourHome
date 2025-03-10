import 'package:flutter/cupertino.dart';
import 'package:yourhome/views/screens/landing_page/LandingPage.dart';
import 'package:yourhome/views/screens/authencation_page/LoginPage.dart';
import 'package:yourhome/views/screens/authencation_page/SignUpPage.dart';

class AppRoutes {
  static const LANDINGPAGE = '/landingpage';
  // static const LOGIN = '/login';
  static const SIGNUP = '/signup';

  static final routes = {
    LANDINGPAGE: (context) => LandingPage(),
    // LOGIN: (context) => LoginPage(),
    SIGNUP: (context) => SignUpPage(),
  };
  //
  // static void goToLoginPage(context) {
  //   Navigator.pushNamed(context, LOGIN);
  // }

  static void goToSignUpPage(context) {
    Navigator.pushNamed(context, SIGNUP);
  }
}
