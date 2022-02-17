import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../components/button.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    List<Widget> lists = [];
    var list = List.generate(9, (_) => _);
    for (int item in list) {
      if (item > 2) {
        lists.add(Container(
            margin: EdgeInsets.all(20),
            child: BaseButton(
                text: "$item X $item",
                onPressed: () => {Get.toNamed("/hy-road?id=$item")})));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
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
              child: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: lists,
        ),
      ))),
    );
  }
}
