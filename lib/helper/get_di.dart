import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/controller/order_controller.dart';
import '../controller/auth_controller.dart';
import '../controller/bank_controller.dart';

Future<void>   init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => OrderController());
  Get.lazyPut(() => BankController());
}
