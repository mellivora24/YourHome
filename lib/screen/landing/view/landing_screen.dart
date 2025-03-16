import 'package:flutter/material.dart';
import 'package:yourhome_web/utils/router_names.dart';
import 'package:yourhome_web/utils/routers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yourhome_web/utils/widget/button_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgrounds/landing-background.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Section 1
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logos/logo-gray.png'),
                      width: 500,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'slogan'.tr(),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Login Button
                    ButtonWidget(
                      width: 300,
                      height: 50,
                      borderRadius: 30,
                      label: 'login_button'.tr(),
                      backgroundColor: Color(0xFFFF7337),
                      iconPath: "assets/images/logos/email.png",
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.loginScreen);
                      },
                    ),
                    SizedBox(height: 10),
                    Text('or'.tr()),
                    SizedBox(height: 10),
                    // Create Account Button
                    ButtonWidget(
                      width: 300,
                      height: 50,
                      borderRadius: 30,
                      iconPath: "",
                      backgroundColor: Colors.black,
                      label: 'create_account_button'.tr(),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Section 2
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    SizedBox(height: 2),
                    Text(
                      'about_us'.tr(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),

                    // Content
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 700,
                              child: Text(
                                'about_us_content'.tr(),
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Text (
                              '-- Your Home DEV Team --',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage('assets/images/image-footer.png'),
                          width: 500,
                        )
                      ],
                    ),

                    // Footer
                    Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('company_name'.tr(), style: TextStyle(color: Colors.white, fontSize: 18)),
                                      Text('  - ${'company_location'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                      Text('  - ${'company_email'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('company_social'.tr(), style: TextStyle(color: Colors.white, fontSize: 18)),
                                      Text('  - ${'company_facebook'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                      Text('  - ${'company_youtube'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('company_career'.tr(), style: TextStyle(color: Colors.white, fontSize: 18)),
                                      Text('  - ${'company_apply'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                      Text('  - ${'company_require'.tr()}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                    ],
                                  )
                                ]
                            ),
                            SizedBox(height: 10),
                            Text(
                              '© CopyRight 2021 - Your Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}