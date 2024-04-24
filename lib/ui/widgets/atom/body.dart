import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Body extends StatelessWidget {
  const Body({
    required this.text,
    super.key,
    this.size = SizeOfThing.medium,
    this.color,
  });

  final String text;

  final SizeOfThing size;

  final Color? color;

  double get fontSize {
    switch (size) {
      case SizeOfThing.small:
        return 12;
      case SizeOfThing.medium:
        return 14;
      case SizeOfThing.large:
        return 16;
      default:
        return 14;
    }
  }

  double get fontHeight {
    switch (size) {
      case SizeOfThing.small:
        return 16 / 12;
      case SizeOfThing.medium:
        return 20 / 14;
      case SizeOfThing.large:
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
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: fontColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
