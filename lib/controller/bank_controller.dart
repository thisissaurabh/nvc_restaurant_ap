
import 'package:get/get.dart';



class BankController extends GetxController {
  BankController();

  List<Category> categoryList = [
    Category(name: 'Withdraw Request'),
    Category(name: 'Payment History'),
  ];

  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;

  // Method to set the selected category index
  void setCategoryIndex(int index) {
    _categoryIndex = index;
    update(); // Notify the listeners about the change
  }
}

class Category {
  final String name;
  Category({required this.name});
}
