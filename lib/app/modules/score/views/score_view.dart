import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/score_controller.dart';

class ScoreView extends GetView<ScoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScoreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
