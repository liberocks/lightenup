import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/widgets/atom/heading.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    required this.text,
    required this.emoji,
    required this.color,
    required this.onTap,
    required this.backgroundStart,
    required this.backgroundEnd,
    this.selected = false,
    super.key,
  });

  final String text;

  final String emoji;

  final Color color;

  final Color backgroundStart;

  final Color backgroundEnd;

  final bool selected;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 24,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundStart, backgroundEnd],
          ),
          border: Border.all(
            color: selected
                ? backgroundStart
                    .withRed(max(backgroundStart.red - 100, 0))
                    .withGreen(max(backgroundStart.green - 100, 0))
                    .withBlue(max(backgroundStart.blue - 100, 0))
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Heading(text: emoji, size: SizeOfThing.large),
              const SizedBox(width: 8),
              Heading(text: text, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
