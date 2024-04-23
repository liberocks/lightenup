import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class Chips extends StatelessWidget {
  const Chips({
    required this.text,
    required this.onPressed,
    super.key,
    this.background,
    this.color,
  });

  final String text;

  final Color? color;

  final Color? background;

  final void Function() onPressed;

  Color get fontColor {
    return color ?? ThemeColor.pale;
  }

  Color get backgroundColor {
    return background ?? ThemeColor.white;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: fontColor, width: 1),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          letterSpacing: 0.1,
          color: fontColor,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
