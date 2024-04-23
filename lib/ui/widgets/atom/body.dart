import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Body extends StatelessWidget {
  const Body({required this.text, super.key, this.size = 'medium', this.color});

  final String text;

  final String size;

  final Color? color;

  double get fontSize {
    switch (size) {
      case 'small':
        return 12;
      case 'medium':
        return 14;
      case 'large':
        return 16;
      default:
        return 14;
    }
  }

  double get fontHeight {
    switch (size) {
      case 'small':
        return 16 / 12;
      case 'medium':
        return 20 / 14;
      case 'large':
        return 24 / 16;
      default:
        return 20 / 14;
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
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: fontColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
