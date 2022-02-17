import 'package:flutter/material.dart';
import '../data/theme.dart';

class BaseButton extends StatelessWidget {
  BaseButton(
      {Key? key,
      required this.text,
      this.bgColor = ThemeColors.primaryColor,
      this.fontsize = 28,
      this.textColor = ThemeColors.textColor,
      this.onPressed})
      : super(key: key);

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? fontsize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: bgColor),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              text,
              style: TextStyle(fontSize: fontsize, color: textColor),
            )),
        onPressed: onPressed);
  }
}
