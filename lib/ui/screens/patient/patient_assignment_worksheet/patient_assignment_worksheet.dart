import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientAssignmentWorksheetScreen extends StatefulWidget {
  const PatientAssignmentWorksheetScreen({required this.assignment, super.key});

  final PatientAssignment assignment;

  @override
  State<PatientAssignmentWorksheetScreen> createState() =>
      _PatientAssignmentWorksheetScreenState();
}

class _PatientAssignmentWorksheetScreenState
    extends State<PatientAssignmentWorksheetScreen> {
  late PatientAssignmentAnswer answer;

  @override
  void initState() {
    super.initState();

    answer = PatientAssignmentAnswer(
      assignmentId: widget.assignment.id,
      worksheets: widget.assignment.worksheets,
      date: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        return Layout(
          bottomNavigationBar: Container(
            height: 130,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    text: 'Submit thoughts',
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    color: ThemeColor.primary500,
                    background: Colors.white,
                    text: 'Abort assignments',
                    onPressed: () {
                      context.router.popForced();
                    },
                  ),
                ),
              ],
            ),
          ),
          onInit: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom],
            );
          },
          onDispose: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom],
            );
          },
          appBar: AppBar(
            toolbarHeight: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.router.popForced();
              },
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        HexColor('#3A3A3A'),
                        HexColor('#252525'),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 6),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 45),
                              Display(
                                text: 'Before we start...',
                                size: SizeOfThing.small,
                                color: Colors.white,
                              ),
                              SizedBox(height: 45),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Heading(
                        text: 'Given by',
                        size: SizeOfThing.small,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ThemeColor.primary500,
                            radius: 20,
                            child: Body(
                              text: widget.assignment.author[0],
                              color: Colors.white,
                              size: SizeOfThing.large,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Body(
                              text: widget.assignment.author,
                              size: SizeOfThing.large,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Heading(
                        text:
                            'Notes from ${widget.assignment.author.split(' ')[0]}',
                        size: SizeOfThing.small,
                      ),
                      const SizedBox(height: 8),
                      Body(
                        text: widget.assignment.notes ?? '',
                        size: SizeOfThing.large,
                      ),
                      const SizedBox(height: 16),
                      const Heading(
                        text: 'What do you need to prepare?',
                        size: SizeOfThing.small,
                      ),
                      const SizedBox(height: 16),
                      ...widget.assignment.preparations
                          .map(
                            (preparation) => [
                              Container(
                                color: ThemeColor.primary100,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Body(
                                        text: preparation,
                                        size: SizeOfThing.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          )
                          .expand((i) => i),
                      const SizedBox(height: 16),
                      const Heading(
                        text: 'Estimated time',
                        size: SizeOfThing.small,
                      ),
                      const SizedBox(height: 8),
                      Body(
                        text: widget.assignment.duration > 1
                            ? '${widget.assignment.duration} minutes'
                            : '${widget.assignment.duration} minute',
                        size: SizeOfThing.large,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
