import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double boxSize = (MediaQuery.of(context).size.width / 2) - 32;
    return Layout(
      child: SizedBox(
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            ChoiceCard(
              boxSize: boxSize,
              icon: Icons.personal_injury,
              text: 'Patient',
              color: Colors.cyan[500]!,
              onTap: () {
                context.read<ChoiceCubit>().setMode(ModeChoice.patient);
                context.read<PatientNavigationCubit>().switchToHome();
                context.router.push(const PatientMainRoute());
              },
            ),
            const SizedBox(width: 16),
            ChoiceCard(
              boxSize: boxSize,
              icon: Icons.local_hospital,
              text: 'Doctor',
              color: Colors.purple[400]!,
              onTap: () {
                context.read<ChoiceCubit>().setMode(ModeChoice.doctor);
                context.read<DoctorNavigationCubit>().switchToHome();
                context.router.push(const DoctorMainRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
