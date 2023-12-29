import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var currIndex = 0.obs;
  void changeValue(var newValue) {
    currIndex.value = newValue;
  }
}
