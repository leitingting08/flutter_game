import 'package:flutter/material.dart';
import 'package:fbutton/fbutton.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.text,
    this.bgColor = Colors.amberAccent,
    this.fontSize = 30,
    this.textColor = Colors.black45,
    this.shadowColor = Colors.black38,
    this.highlightShadowColor = Colors.white,
    this.width = 190,
    this.height = 60,
    this.onPressedDown,
    this.onPressedUp,
    this.onPressedCancel,
  }) : super(key: key);

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final Color? shadowColor;
  final Color? highlightShadowColor;
  final double? fontSize;
  final double? width;
  final double? height;
  void Function()? onPressedDown;
  void Function()? onPressedUp;
  void Function()? onPressedCancel;

  @override
  Widget build(BuildContext context) {
    return FButton(
      isSupportNeumorphism: true,
      lightOrientation: FLightOrientation.LeftTop,
      highlightShadowColor: this.highlightShadowColor,
      shadowColor: this.shadowColor,
      strokeWidth: 3.0,
      width: this.width,
      height: this.height,
      text: this.text,
      style: TextStyle(color: this.textColor, fontSize: this.fontSize),
      alignment: Alignment.center,
      color: this.bgColor,
      onPressed: () {},
      onPressedDown: this.onPressedDown,
      onPressedUp: this.onPressedUp,
      onPressedCancel: this.onPressedCancel,
    );
  }
}
