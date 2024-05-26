import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:lightenup/constants/assignment_type.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({
    required this.title,
    required this.type,
    required this.date,
    this.color,
    this.textColor,
    this.status,
    super.key,
    this.onTap,
  });

  /// The title of the assignment
  final String title;

  /// The subtitle of the assignment
  final AssignmentType type;

  /// The date of the assignment
  final DateTime date;

  /// The status of the assignment
  final String? status;

  /// The function to be called when the card is tapped
  final Function? onTap;

  /// The color of the card
  final Color? color;

  /// The color of the text
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd MMM');

    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minHeight: 72,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? HexColor('#FEF7FF'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            type
                                .toString()
                                .replaceAll('AssignmentType.', '')
                                .replaceAll('_', ' '),
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.5,
                              height: 24 / 16,
                              color: textColor ?? Colors.grey[700],
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.25,
                        height: 20 / 14,
                        color: textColor ?? Colors.grey[700],
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                status ?? dateFormatter.format(date),
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.25,
                  height: 20 / 14,
                  color: textColor ?? Colors.grey[700],
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
