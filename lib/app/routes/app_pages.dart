import 'package:get/get.dart';

import 'package:flutter_game/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_game/app/modules/home/views/home_view.dart';
import 'package:flutter_game/app/modules/hy_road/bindings/hy_road_binding.dart';
import 'package:flutter_game/app/modules/hy_road/views/hy_road_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HY_ROAD,
      page: () => HyRoadView(),
      binding: HyRoadBinding(),
    )
  ];
}
