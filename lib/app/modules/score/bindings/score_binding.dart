import 'package:get/get.dart';

import '../controllers/score_controller.dart';

class ScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreController>(
      () => ScoreController(),
    );
  }
}
