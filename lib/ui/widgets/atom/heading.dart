import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({
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
        return 14;
      case 'medium':
        return 16;
      case 'large':
        return 22;
      default:
        return 16;
    }
  }

  double get fontHeight {
    switch (size) {
      case 'small':
        return 20 / 14;
      case 'medium':
        return 24 / 16;
      case 'large':
        return 28 / 22;
      default:
        return 24 / 16;
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
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: fontColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
