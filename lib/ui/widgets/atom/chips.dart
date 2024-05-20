import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';

class Chips extends StatelessWidget {
  const Chips({
    required this.text,
    required this.onPressed,
    super.key,
    this.background,
    this.color,
    this.borderColor,
    this.selected = false,
  });

  final String text;

  final Color? color;

  final Color? background;

  final void Function() onPressed;

  final bool selected;

  final Color? borderColor;

  Color get fontColor {
    return color ?? ThemeColor.pale;
  }

  Color get backgroundColor {
    return background ?? ThemeColor.white;
  }

  Color get border {
    return borderColor ?? color ?? ThemeColor.pale;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? HexColor('#6750A4') : backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: border,
            width: 1,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          height: 20 / 14,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          letterSpacing: 0.1,
          color: selected ? Colors.white : fontColor,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
