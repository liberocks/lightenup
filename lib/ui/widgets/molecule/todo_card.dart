import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
    this.onTap,
  });

  final String title;

  final String subtitle;

  final IconData icon;

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minHeight: 96,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor('#FEF7FF'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.grey[800],
              ),
              const SizedBox(width: 16),
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
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.5,
                              height: 24 / 16,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Visibility(
                          visible: onTap != null,
                          child: const Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.25,
                        height: 20 / 14,
                        color: Colors.grey[700],
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
