import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/screens/screens.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientMainScreen extends StatelessWidget {
  const PatientMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        return Material(
          child: Stack(
            children: <Widget>[
              patientNavigationState.when(
                home: () => const PatientHomeScreen(),
                schedule: () => const PatientScheduleScreen(),
                profile: () => const PatientProfileScreen(),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavigationItem(
                            text: 'Home',
                            icon: Icons.widgets_outlined,
                            color: Colors.purple[100]!,
                            selected: patientNavigationState ==
                                const PatientNavigationState.home(),
                            onTap: context
                                .read<PatientNavigationCubit>()
                                .switchToHome,
                          ),
                          NavigationItem(
                            text: 'Schedule',
                            icon: Icons.calendar_month_outlined,
                            color: Colors.purple[100]!,
                            selected: patientNavigationState ==
                                const PatientNavigationState.schedule(),
                            onTap: context
                                .read<PatientNavigationCubit>()
                                .switchToSchedule,
                          ),
                          NavigationItem(
                            text: 'Profile',
                            icon: Icons.person_2_outlined,
                            color: Colors.purple[100]!,
                            selected: patientNavigationState ==
                                const PatientNavigationState.profile(),
                            onTap: context
                                .read<PatientNavigationCubit>()
                                .switchToProfile,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
