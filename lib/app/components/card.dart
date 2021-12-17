import 'package:flutter/material.dart';

class DigitalCard extends StatelessWidget {
  DigitalCard(
      {Key? key,
      required this.text,
      this.bgColor = Colors.amberAccent,
      this.fontsize = 60,
      this.textColor = Colors.white70})
      : super(key: key);

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            child: Center(
                child: Text(
              this.text,
              style: TextStyle(fontSize: this.fontsize, color: this.textColor),
            )),
            color: this.bgColor));
  }
}
