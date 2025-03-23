import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhome_web/utils/router_names.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yourhome_web/screen/login/provider/login_notifier.dart';

import 'package:yourhome_web/utils/components/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginNotifier>(context);
    final model = presenter.userModel;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/landing-background.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Login Form
            Container(
              width: 900,
              height: 600,
              decoration: BoxDecoration(
                color: Color(0x9FFF7337),
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 10,
                    // blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'WELCOME BACK',
                    style: TextStyle(
                      fontSize: 32,
                      wordSpacing: 2,
                      letterSpacing: 3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    width: 500,
                    child: TextField(
                      // controller: presenter.emailController,
                      decoration: const InputDecoration(
                        label: Text('Email', style: TextStyle(color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        label: Text('Password', style: TextStyle(color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ButtonWidget(
                    label: 'LOGIN',
                    width: 300,
                    borderRadius: 50,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, RouteNames.homeScreen, (route) => false);
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signUpScreen);
                        },
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Human welcome image
            Image(
              image: AssetImage('assets/images/illustrations/human-welcome.png'),
              width: 500,
            )
          ],
        ),
      )
    );
  }
}
