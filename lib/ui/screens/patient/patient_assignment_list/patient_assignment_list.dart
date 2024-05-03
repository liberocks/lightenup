import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientAssignmentListScreen extends StatelessWidget {
  const PatientAssignmentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientAssignmentCubit, PatientAssignmentState>(
      builder: (context, state) {
        final ongoingAssignments = state.assignments
            .where((element) => element.status == AssignmentStatus.unfinished)
            .toList();
        final completedAssignments = state.assignments
            .where((element) => element.status == AssignmentStatus.finished)
            .toList();

        return Layout(
          appBar: AppBar(
            title: InkWell(
              child: const Text('Assignments'),
              onLongPress: () {
                context.read<PatientAssignmentCubit>().resetDemo();
              },
            ),
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.router.popForced();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.event),
                onPressed: () {},
              ),
            ],
          ),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Heading(text: 'Ongoing'),
                    ...ongoingAssignments.map((assignment) {
                      return AssignmentCard(
                        title: assignment.title,
                        type: assignment.type,
                        date: assignment.createdAt,
                        onTap: () {
                          context.router.push(
                            PatientAssignmentDetailRoute(
                              assignment: assignment,
                            ),
                          );
                        },
                      );
                    }),
                    Visibility(
                      visible: ongoingAssignments.isEmpty,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const EmptyCard(
                          'Holy moly! You have no ongoing assignments.',
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Heading(text: 'Completed'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    ...completedAssignments.map((assignment) {
                      return AssignmentCard(
                        title: assignment.title,
                        type: assignment.subtitle,
                        date: assignment.createdAt,
                        onTap: () {},
                      );
                    }),
                    Visibility(
                      visible: completedAssignments.isEmpty,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const EmptyCard(
                          'You haven’t completed any assignment yet.',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
