import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Headline extends StatelessWidget {
  const Headline({
    required this.text,
    super.key,
    this.size = 'medium',
    this.color,
  });

  final String text;

  final String size;

  final Color? color;

  double get fontSize {
    switch (size) {
      case 'small':
        return 24;
      case 'medium':
        return 28;
      case 'large':
        return 32;
      default:
        return 28;
    }
  }

  double get fontHeight {
    switch (size) {
      case 'small':
        return 32 / 24;
      case 'medium':
        return 36 / 28;
      case 'large':
        return 40 / 32;
      default:
        return 36 / 28;
    }
  }

  Color get fontColor {
    return color ?? ThemeColor.gray;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        height: fontHeight,
        fontWeight: FontWeight.w400,
        fontFamily: 'Rubik',
        color: fontColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
