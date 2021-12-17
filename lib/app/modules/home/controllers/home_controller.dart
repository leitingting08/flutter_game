import 'package:get/get.dart';

class HomeController extends GetxController {
  double neumorphismSize = 30;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment(double num) => neumorphismSize = num;
}
