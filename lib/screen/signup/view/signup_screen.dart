import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhome_web/utils/router_names.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yourhome_web/screen/login/provider/login_notifier.dart';

import 'package:yourhome_web/utils/components/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgrounds/signup-background.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Human welcome image
              Image(
                image: AssetImage('assets/images/illustrations/human-getstarted.png'),
                width: 500,
              ),
              // Login Form
              Container(
                width: 900,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.black,
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
                      'CREATE A NEW ACCOUNT',
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
                        // controller: presenter.passwordController,
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
                    SizedBox(height: 20),
                    Container(
                      width: 500,
                      child: TextField(
                        // controller: presenter.passwordController,
                        decoration: const InputDecoration(
                          label: Text('Your device ID', style: TextStyle(color: Colors.white)),
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.device_unknown_outlined, color: Colors.white),
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
                      label: 'CREATE ACCOUNT',
                      width: 300,
                      borderRadius: 50,
                      onPressed: () {},
                    ),
                    SizedBox(height: 50),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.loginScreen);
                      },
                      child: Text(
                        'Have an account? Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
