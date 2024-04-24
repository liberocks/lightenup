import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/widgets/atom/label.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    required this.boxSize,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color = const Color(0xFF00ACC1),
    super.key,
  });

  final double boxSize;

  final String text;

  final Color color;

  final IconData icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        width: boxSize,
        height: boxSize,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 32,
                color: color,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Label(
                    text: text,
                    size: SizeOfThing.large,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
