import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    required this.boxSize,
    required this.text,
    required this.asset,
    required this.onTap,
    this.gradient,
    super.key,
  });

  final double boxSize;

  final String text;

  final Gradient? gradient;

  final String asset;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        width: boxSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                asset,
                height: boxSize,
                width: boxSize,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: gradient == null ? Colors.grey[100] : null,
                gradient: gradient,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Heading(
                text: text,
                size: SizeOfThing.medium,
                color: HexColor('#240046'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
