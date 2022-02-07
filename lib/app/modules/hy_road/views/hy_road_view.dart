import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';
import 'package:get/get.dart';
import '../controllers/hy_road_controller.dart';
import '../../../components/button.dart';

// 恭喜你通关啦!\n用时$time
class HyRoadView extends GetView<HyRoadController> {
  final textStyle = TextStyle(
      fontSize: 24, color: Get.isDarkMode ? Colors.white54 : Colors.black54);
  @override
  Widget build(BuildContext context) {
    String? lattice = Get.parameters["id"];
    int id = int.parse(lattice!);
    return Scaffold(
      appBar: AppBar(
        title: Text('数字华容道'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark())
                  },
              icon: Icon(Icons.light_mode, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          child: Obx(() => Text(
                "时间：${controller.time}",
                style: textStyle,
              )),
        ),
        Container(
          height: Platform.isIOS ? 388 : 320,
          color: Colors.brown[200],
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(20),
          child: Card(
            child: Obx(() => GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: id,
                children: controller.lists.value)),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20, bottom: 40),
            child: Obx(() => MyButton(
                  text: controller.startText.value,
                  onPressedDown: () => {controller.isReady(true)},
                ))),
      ]))),
    );
  }
}
