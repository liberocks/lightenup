import 'package:flutter/material.dart';
import 'package:lightenup/ui/widgets/atom/label.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    required this.text,
    required this.icon,
    required this.color,
    super.key,
    this.selected = false,
    this.onTap,
  });

  final String text;

  final IconData icon;

  final Color color;

  final bool selected;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 32,
            decoration: BoxDecoration(
              color: selected ? Colors.purple[100] : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Label(text: text),
        ],
      ),
    );
  }
}
