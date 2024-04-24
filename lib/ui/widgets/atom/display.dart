import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Display extends StatelessWidget {
  const Display({
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
        return 36;
      case SizeOfThing.medium:
        return 45;
      case SizeOfThing.large:
        return 57;
      default:
        return 45;
    }
  }

  double get fontHeight {
    switch (size) {
      case SizeOfThing.small:
        return 44 / 36;
      case SizeOfThing.medium:
        return 52 / 45;
      case SizeOfThing.large:
        return 64 / 57;
      default:
        return 52 / 45;
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
        fontFamily: 'Rubik',
        color: fontColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
