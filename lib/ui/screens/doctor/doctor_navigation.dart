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
            children: <Widget>[
              doctorNavigationState.when(
                home: () => const DoctorHomeScreen(),
                assignments: () => const DoctorAssignmentsScreen(),
                schedule: () => const DoctorScheduleScreen(),
                profile: () => const DoctorProfileScreen(),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavigationItem(
                            text: 'Home',
                            icon: Icons.widgets_outlined,
                            color: Colors.purple[100]!,
                            selected: doctorNavigationState ==
                                const DoctorNavigationState.home(),
                            onTap: context
                                .read<DoctorNavigationCubit>()
                                .switchToHome,
                          ),
                          NavigationItem(
                            text: 'Assignments',
                            icon: Icons.task_outlined,
                            color: Colors.purple[100]!,
                            selected: doctorNavigationState ==
                                const DoctorNavigationState.assignments(),
                            onTap: context
                                .read<DoctorNavigationCubit>()
                                .switchToAssignments,
                          ),
                          NavigationItem(
                            text: 'Schedule',
                            icon: Icons.calendar_month_outlined,
                            color: Colors.purple[100]!,
                            selected: doctorNavigationState ==
                                const DoctorNavigationState.schedule(),
                            onTap: context
                                .read<DoctorNavigationCubit>()
                                .switchToSchedule,
                          ),
                          NavigationItem(
                            text: 'Profile',
                            icon: Icons.person_2_outlined,
                            color: Colors.purple[100]!,
                            selected: doctorNavigationState ==
                                const DoctorNavigationState.profile(),
                            onTap: context
                                .read<DoctorNavigationCubit>()
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
