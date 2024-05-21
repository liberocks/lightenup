import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorPatientMoodHistoryScreen extends StatefulWidget {
  const DoctorPatientMoodHistoryScreen({
    required this.patientId,
    super.key,
  });

  final int patientId;

  @override
  State<DoctorPatientMoodHistoryScreen> createState() =>
      _DoctorPatientMoodHistoryScreenState();
}

class _DoctorPatientMoodHistoryScreenState
    extends State<DoctorPatientMoodHistoryScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final patient =
        context.read<DoctorPatientListCubit>().state.patients.firstWhere(
              (element) => element.id == widget.patientId,
            );

    return Layout(
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
        title: Text("${patient.name}'s Log"),
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
                color: HexColor('#F0EBE8'),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.router.popForced();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: HexColor('#1D1B20'),
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Heading(
                          text: 'Patient details',
                          size: SizeOfThing.large,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CircleAvatar(
                      backgroundColor: HexColor('#AAAAAA'),
                      backgroundImage: NetworkImage(
                        context
                            .read<DoctorPatientListCubit>()
                            .state
                            .patients
                            .firstWhere(
                              (element) => element.id == widget.patientId,
                            )
                            .profilePicture,
                      ),
                      radius: 48,
                    ),
                    const SizedBox(height: 16),
                    Headline(
                      text: context
                          .read<DoctorPatientListCubit>()
                          .state
                          .patients
                          .firstWhere(
                            (element) => element.id == widget.patientId,
                          )
                          .name,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: HexColor('#F0EBE8'),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: MediaQuery.of(context).size.width - 32,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.assignment,
                    color: HexColor('#444444'),
                    size: 24,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diagnosis',
                            style: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: HexColor('#111111'),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            context
                                .read<DoctorPatientListCubit>()
                                .state
                                .patients
                                .firstWhere(
                                  (element) => element.id == widget.patientId,
                                )
                                .diagnosis,
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: HexColor('#444444'),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Heading(
                      text: 'Daily mood tracker',
                      color: HexColor('#111111'),
                    ),
                  ),
                  Label(
                    text: 'View log',
                    color: HexColor('#6750A4'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 72,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor(
                        context
                            .read<DoctorPatientListCubit>()
                            .state
                            .patients
                            .firstWhere(
                              (element) => element.id == widget.patientId,
                            )
                            .moods
                            .first
                            .backgroundHexStart,
                      ),
                      HexColor(
                        context
                            .read<DoctorPatientListCubit>()
                            .state
                            .patients
                            .firstWhere(
                              (element) => element.id == widget.patientId,
                            )
                            .moods
                            .first
                            .backgroundHexEnd,
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        context
                            .read<DoctorPatientListCubit>()
                            .state
                            .patients
                            .firstWhere(
                              (element) => element.id == widget.patientId,
                            )
                            .moods
                            .first
                            .emoji,
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Heading(
                            text: context
                                .read<DoctorPatientListCubit>()
                                .state
                                .patients
                                .firstWhere(
                                  (element) => element.id == widget.patientId,
                                )
                                .moods
                                .first
                                .moodText,
                            size: SizeOfThing.large,
                            color: HexColor(
                              context
                                  .read<DoctorPatientListCubit>()
                                  .state
                                  .patients
                                  .firstWhere(
                                    (element) => element.id == widget.patientId,
                                  )
                                  .moods
                                  .first
                                  .colorHex,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Label(text: 'Reason:', size: SizeOfThing.large),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: context
                        .read<DoctorPatientListCubit>()
                        .state
                        .patients
                        .firstWhere((element) => element.id == widget.patientId)
                        .moods
                        .first
                        .reasons
                        .map(
                          (e) => Chips(
                            text: e,
                            borderColor: Colors.transparent,
                            selected: false,
                            color: Colors.black,
                            background: HexColor('#E6E6E6'),
                            onPressed: () {},
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  const Label(text: 'Notes', size: SizeOfThing.large),
                  const SizedBox(height: 8),
                  Body(
                    text: context
                        .read<DoctorPatientListCubit>()
                        .state
                        .patients
                        .firstWhere((element) => element.id == widget.patientId)
                        .moods
                        .first
                        .notes,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(
                    text: 'Last assignment',
                    color: HexColor('#111111'),
                  ),
                  AssignmentCard(
                    color: HexColor('F8F8F8'),
                    title: 'Anxiety Worksheet',
                    type: AssignmentType.Socratic_Questions,
                    date: DateTime.now(),
                    status: 'Finished',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
