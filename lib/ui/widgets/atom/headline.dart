import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Headline extends StatelessWidget {
  const Headline({
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
        return 24;
      case SizeOfThing.medium:
        return 28;
      case SizeOfThing.large:
        return 32;
      default:
        return 28;
    }
  }

  double get fontHeight {
    switch (size) {
      case SizeOfThing.small:
        return 32 / 24;
      case SizeOfThing.medium:
        return 36 / 28;
      case SizeOfThing.large:
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
