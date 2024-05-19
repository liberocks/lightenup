import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lightenup/ui/widgets/atom/body.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard(this.text, {super.key, this.height = 96});

  final String text;

  final double height;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [4, 2],
      color: Colors.grey[500]!,
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Body(
          text: text,
        ),
      ),
    );
  }
}
