import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorPatientDetailsScreen extends StatefulWidget {
  const DoctorPatientDetailsScreen({
    required this.patientId,
    super.key,
  });

  final int patientId;

  @override
  State<DoctorPatientDetailsScreen> createState() =>
      _DoctorPatientDetailsScreenState();
}

class _DoctorPatientDetailsScreenState
    extends State<DoctorPatientDetailsScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  void showDiagnosisDialog() {
    _textFieldController.clear();
    _textFieldController.text = context
        .read<DoctorPatientListCubit>()
        .state
        .patients
        .firstWhere((element) => element.id == widget.patientId)
        .diagnosis;

    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      btnOk: SecondaryButton(
        borderColor: Colors.transparent,
        text: 'Save changes',
        onPressed: () {
          context
              .read<DoctorPatientListCubit>()
              .setPatientDiagnosis(widget.patientId, _textFieldController.text);
          _textFieldController.clear();
          Navigator.of(context).pop();
        },
      ),
      btnCancel: SecondaryButton(
        borderColor: Colors.transparent,
        text: 'Cancel',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Icon(
              Icons.assignment,
              color: HexColor('#444444'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Edit Diagnosis',
              style: TextStyle(
                fontSize: 24,
                height: 32 / 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: HexColor('#1D1B20'),
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Describe the patient condition to help you decide the treatment plan, what type of assignment, and others.',
              style: TextStyle(
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: HexColor('#49454F'),
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: _textFieldController,
              maxLines: null,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HexColor('#49454F'), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HexColor('#49454F'), width: 1.0),
                ),
                hintText: 'Type diagnosis here...',
              ),
            ),
          ),
        ],
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorPatientListCubit, DoctorPatientListState>(
      builder: (context, state) {
        final patient = state.patients.firstWhere(
          (element) => element.id == widget.patientId,
        );

        return Layout(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              text: 'Send new assignment',
              onPressed: () {
                AutoRouter.of(context).push(
                  DoctorNewAssignmentRoute(
                    patientId: widget.patientId,
                  ),
                );
              },
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
                          backgroundImage: AssetImage(patient.profilePicture),
                          radius: 48,
                        ),
                        const SizedBox(height: 16),
                        Headline(
                          text: patient.name,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                patient.diagnosis,
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
                      InkWell(
                        onTap: showDiagnosisDialog,
                        child: Icon(
                          Icons.edit_outlined,
                          color: HexColor('#444444'),
                          size: 18,
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
                      InkWell(
                        onTap: () {
                          context.router.push(
                            DoctorPatientMoodHistoryRoute(
                              patientId: widget.patientId,
                            ),
                          );
                        },
                        child: Label(
                          text: 'View log',
                          color: HexColor('#6750A4'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 72,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor(
                            patient.moods.first.backgroundHexStart,
                          ),
                          HexColor(
                            patient.moods.first.backgroundHexEnd,
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
                            patient.moods.first.emoji,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Heading(
                                text: patient.moods.first.moodText,
                                size: SizeOfThing.large,
                                color: HexColor(
                                  patient.moods.first.colorHex,
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
                        children: patient.moods.first.reasons
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
                        text: patient.moods.first.notes,
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
      },
    );
  }
}
