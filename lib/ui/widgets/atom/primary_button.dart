import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return color ?? ThemeColor.white;
  }

  Color get backgroundColor {
    return background ?? ThemeColor.primary500;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
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
