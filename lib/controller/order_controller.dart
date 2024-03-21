import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderController();

  List<Category> categoryList = [
    Category(name: 'Pending'),
    Category(name: 'Confirm'),
    Category(name: 'Ready to deliver'),
    Category(name: 'Delivered'),
  ];

  List<Category> categoryListOrderHistory = [
    Category(name: 'All Orders'),
    Category(name: 'Processing'),
    Category(name: 'Pending'),
    Category(name: 'Delivered'),

  ];

  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;


  void setCategoryIndex(int index) {
    _categoryIndex = index;
    update();
  }
}

class Category {
  final String name;
  Category({required this.name});
}
