import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double boxSize = (MediaQuery.of(context).size.width / 2) - 32;

    if (boxSize <= 0) {
      boxSize = 150;
    }

    return Layout(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: InkWell(
                  onTap: () {
                    context.read<DoctorPatientListCubit>().resetPatientList();
                    context.read<PatientAssignmentCubit>().resetDemo();
                    toastification.show(
                      alignment: Alignment.bottomCenter,
                      style: ToastificationStyle.fillColored,
                      context: context,
                      showProgressBar: false,
                      title: const Text('Demo data is reset'),
                    );
                  },
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Headline(
                text: 'Demo app as:',
                color: Colors.grey[400],
                size: SizeOfThing.small,
              ),
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceCard(
                    boxSize: boxSize,
                    asset: 'assets/images/patient.png',
                    text: 'Patient',
                    gradient: LinearGradient(
                      colors: [
                        HexColor('#CDB7FD'),
                        HexColor('#80DEF8'),
                      ],
                    ),
                    onTap: () {
                      context.read<ChoiceCubit>().setMode(ModeChoice.patient);
                      context.read<PatientNavigationCubit>().switchToHome();
                      context.router.push(const PatientMainRoute());
                    },
                  ),
                  ChoiceCard(
                    boxSize: boxSize,
                    asset: 'assets/images/professional.png',
                    text: 'Professional',
                    onTap: () {
                      context.read<ChoiceCubit>().setMode(ModeChoice.doctor);
                      context.read<DoctorNavigationCubit>().switchToHome();
                      context.router.push(const DoctorMainRoute());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
