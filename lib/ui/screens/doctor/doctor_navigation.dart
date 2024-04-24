import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorMainScreen extends StatelessWidget {
  const DoctorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorNavigationCubit, DoctorNavigationState>(
      builder: (context, doctorNavigationState) {
        return Layout(
          appBar: AppBar(
            title: const Text('Doctor'),
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationItem(
                  text: 'Home',
                  icon: Icons.widgets_outlined,
                  color: Colors.purple[100]!,
                  selected: doctorNavigationState == DoctorNavigationState.home,
                  onTap: context.read<DoctorNavigationCubit>().switchToHome,
                ),
              ],
            ),
          ),
          child: Container(
            color: Colors.white,
            child: const Text('Home'),
          ),
        );
      },
    );
  }
}
