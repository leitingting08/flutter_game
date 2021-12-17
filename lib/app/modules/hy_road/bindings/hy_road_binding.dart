import 'package:get/get.dart';

import '../controllers/hy_road_controller.dart';

class HyRoadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HyRoadController>(
      () => HyRoadController(),
    );
  }
}
