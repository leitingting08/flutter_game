import 'package:flutter/material.dart';
import '../data/theme.dart';

class DigitalCard extends StatelessWidget {
  DigitalCard(
      {Key? key,
      required this.text,
      this.bgColor = ThemeColors.primaryColor,
      this.fontsize = 60,
      this.textColor = ThemeColors.textColor})
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
              text,
              style: TextStyle(fontSize: fontsize, color: textColor),
            )),
            color: bgColor));
  }
}
