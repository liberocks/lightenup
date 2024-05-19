import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    required this.title,
    required this.answer,
    super.key,
    this.hint = 'Tell what you have found...',
    this.subtitle,
    this.onChanged,
  });

  final String title;

  final String hint;

  final String? subtitle;

  final String answer;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: title, size: SizeOfThing.large),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: answer,
          onChanged: onChanged,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            hintText: hint,
            fillColor: HexColor('#FFFFFF'),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('#79747E')),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.primary500, width: 2),
            ),
          ),
          maxLines: null,
        ),
        Visibility(
          visible: subtitle != null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(subtitle ?? ''),
          ),
        ),
      ],
    );
  }
}
