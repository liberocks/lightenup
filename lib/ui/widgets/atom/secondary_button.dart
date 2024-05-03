import 'package:flutter/material.dart';
import 'package:lightenup/constants/colors.dart';
import 'package:lightenup/constants/constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.background,
    this.color,
    this.disabled,
    this.loading = false,
  });

  final String text;

  final Color? color;

  final Color? background;

  final void Function() onPressed;

  final bool? disabled;

  final bool loading;

  Color get fontColor {
    return color ?? ThemeColor.primary500;
  }

  Color get backgroundColor {
    return background ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          side: BorderSide(
            color: fontColor,
            width: 1.5,
          ),
        ),
        onPressed:
            (disabled != null && disabled!) || loading ? null : onPressed,
        child: loading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.grey[600],
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.3,
                  color: fontColor,
                  decoration: TextDecoration.none,
                ),
              ),
      ),
    );
  }
}
