import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/screens/doctor/doctor.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorMainScreen extends StatelessWidget {
  const DoctorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorNavigationCubit, DoctorNavigationState>(
      builder: (context, doctorNavigationState) {
        return Material(
          child: Stack(
            children: [
              doctorNavigationState.when(home: () => const DoctorHomeScreen()),
              Container(
                alignment: Alignment.bottomCenter,
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationItem(
                        text: 'Home',
                        icon: Icons.widgets_outlined,
                        color: Colors.purple[100]!,
                        selected: doctorNavigationState ==
                            const DoctorNavigationState.home(),
                        onTap:
                            context.read<DoctorNavigationCubit>().switchToHome,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
