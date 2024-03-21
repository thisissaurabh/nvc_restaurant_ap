import 'dart:convert';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/view/screen/order/screens/order_details_screen.dart';
import '../view/screen/auth/sign_in_screen.dart';
import '../view/screen/dashboard/dashboard_Screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String main = '/main';
  static const String orderDetails = '/order-details';

  static String getInitialRoute() => initial;
  // static String getSplashRoute(NotificationBody? body) {
  //   String data = 'null';
  //   if(body != null) {
  //     List<int> encoded = utf8.encode(jsonEncode(body.toJson()));
  //     data = base64Encode(encoded);
  //   }
  //   return '$splash?data=$data';
  // }
  static String getSignInRoute() => signIn;
  static String getMainRoute() => main;
  static String getOrderDetailsRoute() => orderDetails;



  static List<GetPage> routes = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: initial, page: () => SignInScreen()),
    GetPage(name: orderDetails, page: () =>const  OrderDetails()),
    GetPage(name: main, page: () => const DashboardScreen(pageIndex: 0,
    )),
  ];
}