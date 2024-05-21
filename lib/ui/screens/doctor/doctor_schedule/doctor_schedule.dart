import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorScheduleScreen extends StatelessWidget {
  const DoctorScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorNavigationCubit, DoctorNavigationState>(
      builder: (context, doctorNavigationState) {
        return Layout(
          onInit: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom],
            );
          },
          appBar: AppBar(
            title: const Text('Profile'),
            leading: Container(),
            leadingWidth: 0,
          ),
          child: Container(
            color: Colors.white,
            child: Container(),
          ),
        );
      },
    );
  }
}
