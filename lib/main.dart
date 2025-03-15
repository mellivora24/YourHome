import 'package:flutter/material.dart';
import 'package:yourhome/utils/routers.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      supportedLocales: [Locale('en'), Locale('vi')],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: context.locale,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.LANDINGPAGE,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}