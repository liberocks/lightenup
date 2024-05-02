import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientAssignmentListScreen extends StatelessWidget {
  const PatientAssignmentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        return Layout(
          appBar: AppBar(
            title: const Text('Assignments'),
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
