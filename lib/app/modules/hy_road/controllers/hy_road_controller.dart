import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../../data/utils.dart';
import 'package:flutter/material.dart';
import '../../../components/card.dart';

class HyRoadController extends GetxController {
  int id = 3;
  var timer = null;
  double ftSize = 50;
  Map martrix = {}.obs;
  var lists = Rx<List<Widget>>([]);
  int index_0 = 0;
  int dr = 0;
  int dc = 0;
  final time = '00:00'.obs;
  final count = 0.obs;
  final ready = false.obs;
  final startText = '开始游戏'.obs;
  final gridList = Rx<List<int>>([]);
  final gameover = false.obs;
  Rx<String?> lattice = Get.parameters["id"].obs;

  @override
  void onInit() {
    super.onInit();
    lattice.value = Get.parameters["id"];
    clearTimer();
    id = int.parse(lattice.value!);
    initGrid(id * id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
  }

  void clearTimer() {
    timer?.cancel();
    time.value = '00:00';
    count.value = 0;
  }

  void isReady(bool start) {
    ready.value = start;
    startText.value = '重新开始';
    clearTimer();
    startTimer();
    arrRandom(id * id);
    initGrid(null);
  }

  arrRandom(n) {
    // 生成数组-直接随机生成容易无法完成-先有序然后随机滑动打乱
    gridList.value = List.generate(n, (index) => index == n ? 0 : index);
    gridList.value.forEach((element) {
      martrix[element] = element;
    });
    for (int j = 0; j < 100; j++) {
      var rng = new Random();
      double dx_random = (-1 + rng.nextInt(2) + rng.nextDouble()); // 范围 -1~1
      double dy_random = (-1 + rng.nextInt(2) + rng.nextDouble()); // 范围 -1~1
      int i_random = 1 + rng.nextInt(n - 1); // 可以移动的i不为0 范围 1~(n-1) eg: 1~8
      int index_random = rng.nextInt(n); // 索引 范围 0~(n-1) eg: 0~8
      transformCard(dx_random, dy_random, i_random, index_random);
    }
    martrix.forEach((key, value) {
      gridList.value[key] = value;
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (t) {
      time.value = formateTime(count.value++);
    });
  }

  double? getSize(int key) {
    Map<int, double> map = {
      3: 70,
      4: 60,
      5: 50,
      6: 40,
      7: 30,
      8: 20,
    };
    return map[key];
  }

  void transformCard(double dx, double dy, int i, int index) {
    dr = (index - index_0).abs() ~/ id;
    dc = (index - index_0).abs();
    // 同一行索引取整相同
    bool isSameRow = index ~/ id == index_0 ~/ id;
    // 同一列索引取余相等
    bool isSameColumn = index % id == index_0 % id;
    if (dy.abs() > dx.abs()) {
      // y轴滑动 上下
      if (dy > 0) {
        // 上滑 - 看和0是否在同一列且0的索引小于i索引
        if (index > index_0 && isSameColumn) {
          // 如果相邻则交换位置即可，不相邻则直到0之前的元素顺序上移，0换到i的位置
          var temp = martrix[index_0];
          for (int j = 0; j < dr; j++) {
            martrix[index_0 + (j * id)] = martrix[index_0 + ((j + 1) * id)];
          }
          martrix[index] = temp;
          index_0 = index;
        }
      } else if (dy < 0) {
        // 下滑 - 看和0是否在同一列且0的索引大于i索引
        // 1 4 7

        if (index < index_0 && isSameColumn) {
          var temp = martrix[index_0];
          for (int j = 0; j < dr; j++) {
            martrix[index_0 - (j * id)] = martrix[index_0 - ((j + 1) * id)];
          }
          martrix[index] = temp;
          index_0 = index;
        }
      }
    }

    if (dx.abs() > dy.abs()) {
      if (dx > 0) {
        // 左滑 - 看和0是否在同一行且0的索引小于i索引
        if (index > index_0 && isSameRow) {
          var temp = martrix[index_0];
          for (int j = 0; j < dc; j++) {
            martrix[index_0 + j] = martrix[index_0 + j + 1];
          }
          martrix[index] = temp;
          index_0 = index;
        }
      } else if (dx < 0) {
        // 右滑 - 看和0是否在同一行且0的索引大于i索引
        if (index < index_0 && isSameRow) {
          var temp = martrix[index_0];
          for (int j = 0; j < dc; j++) {
            martrix[index_0 - j] = martrix[index_0 - j - 1];
          }
          martrix[index] = temp;
          index_0 = index;
        }
      }
    }
  }

  Widget _renderCount(i, index) {
    // 初始化可以玩的游戏盘
    double positionX = 0;
    double positionY = 0;
    martrix[index] = i;
    return Listener(
      child: Obx(() => DigitalCard(
            text: "${martrix[index]}",
            fontsize: ftSize,
            bgColor:
                martrix[index] == 0 ? Colors.transparent : Colors.amberAccent,
          )),
      onPointerDown: (PointerDownEvent event) {
        positionX = event.position.dx;
        positionY = event.position.dy;
      },
      onPointerUp: (PointerUpEvent event) {
        var dx = positionX - event.position.dx;
        var dy = positionY - event.position.dy;
        transformCard(dx, dy, i, index);
        // 游戏结束
        bool flag = true;
        if (martrix[gridList.value.length - 1] != 0) {
          flag = false;
        }
        gridList.value.forEach((element) {
          if (element > 0 && martrix[element - 1] != element) {
            flag = false;
          }
        });
        if (flag) {
          gameover.value = true;
          timer?.cancel();
          Get.defaultDialog(
            title: '提示',
            content: Text(
              '恭喜你通关啦!\n用时$time',
              style: TextStyle(fontSize: 28),
            ),
            confirm: TextButton(
                child: Text(
                  '好耶😝',
                  style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                ),
                onPressed: () => Get.back()),
            cancel: TextButton(
                child: Text(
                  '我知道了😎',
                  style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                ),
                onPressed: () => Get.back()),
          );
        }
      },
    );
  }

  void initGrid(int? gridnum) {
    ftSize = getSize(id)!;
    // 初始化 首次进入页面的展示
    if (gridnum != null) {
      lists.value = [];
      for (int i = 1; i < gridnum; i++) {
        lists.value.add(DigitalCard(
          text: "${i}",
          fontsize: ftSize,
        ));
      }
    } else {
      lists.value = [];
      lists.value = gridList.value
          .asMap()
          .map((index, i) => MapEntry(index, _renderCount(i, index)))
          .values
          .toList();
    }
  }
}
