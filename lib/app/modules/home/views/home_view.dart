import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../components/button.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    List<Widget> lists = [];
    var list = new List.generate(9, (_) => _);
    for (int item in list) {
      if (item > 2) {
        lists.add(Container(
          margin: EdgeInsets.all(20),
          child: MyButton(
              text: "${item} X ${item}",
              onPressedUp: () => {Get.toNamed("/hy-road?id=${item}")}),
        ));
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
      // drawer: Drawer(
      //     child: ListView(padding: EdgeInsets.zero, children: [
      //   const DrawerHeader(
      //     decoration: BoxDecoration(),
      //     child: Text('Drawer Header'),
      //   ),
      //   ListTile(
      //     title: const Text('切换主题色'),
      //     onTap: () {},
      //   ),
      // ])),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: lists,
        ),
      )),
    );
  }
}
