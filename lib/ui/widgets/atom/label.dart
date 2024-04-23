import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    this.color,
    super.key,
    this.size = 'medium',
  });

  final String text;

  final String size;

  final Color? color;

  double get fontSize {
    switch (size) {
      case 'small':
        return 11;
      case 'medium':
        return 12;
      case 'large':
        return 14;
      default:
        return 12;
    }
  }

  double get fontHeight {
    switch (size) {
      case 'small':
        return 16 / 11;
      case 'medium':
        return 16 / 12;
      case 'large':
        return 20 / 14;
      default:
        return 16 / 12;
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
