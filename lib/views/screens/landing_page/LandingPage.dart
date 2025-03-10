import 'package:flutter/material.dart';
import 'package:yourhome/utils/routers.dart';
import 'package:yourhome/utils/core/ButtonWidget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo-gray.png'),
                        width: 500,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Bridging the Physical and Digital Worlds for a Smarter, More Connected Tomorrow.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 50),
                      ButtonWidget(
                          iconPath: "assets/images/email.png",
                          label: "Login with Email",
                          color: Color(0xffff7337),
                          width: 300,
                          height: 50,
                          onPressed: () => {
                            Navigator.pushNamed(context, '/login')
                          }
                      ),
                      SizedBox(height: 10),
                      Text("OR"),
                      SizedBox(height: 10),
                      ButtonWidget(
                          iconPath: "",
                          label: "Create a new account",
                          color: Colors.black,
                          width: 300,
                          height: 50,
                          onPressed: () => {
                            AppRoutes.goToSignUpPage(context)
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      )
    );
  }
}
