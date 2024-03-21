import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/theme/light_theme.dart';
import 'helper/route_helper.dart';
import 'utils/app_constants.dart';
import 'helper/get_di.dart' as di;


Future<void> main() async {
  if(!GetPlatform.isWeb) {
    HttpOverrides.global = MyHttpOverrides();
  }
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme:  light,
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,

      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
      // home: HomeScreen(),
      // home: SignInScreen(),
      builder: (BuildContext context, widget) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget!);
      },
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


