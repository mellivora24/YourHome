import 'package:error_stack/error_stack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yourhome_web/providers/provider_setup.dart';
import 'package:yourhome_web/screen/landing/view/landing_screen.dart';
import 'package:yourhome_web/screen/login/view/login_screen.dart';
import 'package:yourhome_web/utils/core/constants/dimension_constants.dart';
import 'package:yourhome_web/utils/core/helpers/local_storage_helper.dart';
import 'package:yourhome_web/utils/routers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'service/service_config//notification_service.dart';
import 'service/service_config/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  // await dotenv.load(fileName: ".env");
  /// khởi tạo Firebase
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: dotenv.env['API_KEY']!,
  //     appId: dotenv.env['APP_ID']!,
  //     messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
  //     projectId: dotenv.env['PROJECT_ID']!,
  //   ),
  // );

  /// Firebase Service
  // final firebaseService = FirebaseService();



  Locale defaultLocale = const Locale('en');
  String? savedLocale = LocalStorageHelper.getValue('languageCode');
  if (savedLocale != null) {
    defaultLocale = Locale(savedLocale);
  }

  await ErrorStack.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: ProviderSetup.getProviders(),
        child: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Khởi tạo Notification Service với context

    // final NotificationService _notificationService = NotificationService();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _notificationService.init(context);
    // });

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,

      builder: (context, child) {
        return MaterialApp(
          routes: routes,
          title: 'Your Home',
          locale: context.locale,
          home: const LandingScreen(),
          onGenerateRoute: generateRoutes,
          debugShowCheckedModeBanner: false,
          supportedLocales: context.supportedLocales,
          navigatorKey: NavigationService.navigatorKey,
          localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}
