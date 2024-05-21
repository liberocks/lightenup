import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/widgets/atom/atom.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    required this.name,
    required this.diagnosis,
    required this.profilePicture,
    super.key,
    this.onTap,
  });

  /// The name of the patient
  final String name;

  /// The diagnosis of the patient
  final String diagnosis;

  /// The profile picture of the patient
  final String profilePicture;

  /// The function to be called when the card is tapped
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            minHeight: 80,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('#F0EBE8'),
            border: Border.all(color: HexColor('#CAC4D0')),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: HexColor('#AAAAAA'),
                  backgroundImage: NetworkImage(profilePicture),
                  radius: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading(
                        text: name,
                        size: SizeOfThing.medium,
                        color: HexColor('#1D1B20'),
                      ),
                      Body(
                        text: diagnosis,
                        size: SizeOfThing.large,
                        color: HexColor('#1D1B20'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
