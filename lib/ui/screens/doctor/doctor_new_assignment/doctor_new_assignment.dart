import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/ui/screens/patient/patient_assignment_socratic_questions_worksheet/widgets/widgets.dart';
import 'package:lightenup/ui/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class DoctorNewAssignmentScreen extends StatefulWidget {
  const DoctorNewAssignmentScreen({
    required this.patientId,
    super.key,
  });

  final int patientId;

  @override
  State<DoctorNewAssignmentScreen> createState() =>
      _DoctorNewAssignmentScreenState();
}

class _DoctorNewAssignmentScreenState extends State<DoctorNewAssignmentScreen> {
  int step = 0;
  int page = 0;
  String topic = "";
  String worksheet = "";
  bool isLoading = false;
  bool isReviewing = false;
  late Patient patient;
  late PatientAssignment assignment;

  switchToFactOrOpinion() {
    setState(() {
      worksheet = 'fact_or_opinion';
      assignment = PatientAssignment(
        id: 3,
        title: 'Anxiety Worksheet',
        subtitle:
            'Help your brain to differentiate between facts or opinion statements.',
        author: 'Karina Saraswati',
        type: AssignmentType.Facts_or_Opinion,
        preparations: [
          'Read each of statements and identify if they are <b>fact</b> or <b>opinion</b>.',
          'With practice, you can get better at spotting the difference between fact and opinion',
        ],
        totalPages: 5,
        duration: 30,
        worksheets: [
          PatientWorksheet(
            page: 0,
            title: 'I listened to my friend talk about their bad day.',
          ),
          PatientWorksheet(
            page: 1,
            title: 'I am a good friend.',
          ),
          PatientWorksheet(
            page: 2,
            title: 'I am ugly.',
          ),
          PatientWorksheet(
            page: 3,
            title: 'I have a blemish on my face.',
          ),
          PatientWorksheet(
            page: 4,
            title: 'My hair looks bad.',
          ),
          PatientWorksheet(
            page: 5,
            title: 'My boss said that I did a great job on the project.',
          ),
          PatientWorksheet(
            page: 6,
            title: 'No one will ever like me.',
          ),
          PatientWorksheet(
            page: 7,
            title: 'My crush said "no" when I asked them out.',
          ),
          PatientWorksheet(
            page: 8,
            title: "I'm not as smart as the rest of my class.",
            subtitle:
                "You can tell what thoughts or which facts that support it.",
            hint: 'Tell what you have found...',
          ),
          PatientWorksheet(
            page: 9,
            title: "I'm lazy.",
          ),
          PatientWorksheet(
            page: 10,
            title: 'I watched TV instead of doing my homework.',
          ),
          PatientWorksheet(
            page: 11,
            title:
                'My friend is angry at me. I know this because they were frowning.',
          ),
          PatientWorksheet(
            page: 12,
            title: 'My friend frowned.',
          ),
          PatientWorksheet(
            page: 13,
            title: 'Everyone was bored during my speech.',
          ),
          PatientWorksheet(
            page: 14,
            title: 'I should always be nice',
          ),
        ],
        createdAt: DateTime.now(),
      );
    });
  }

  switchToSocratic() {
    setState(() {
      worksheet = 'socratic';
      assignment = PatientAssignment(
        id: 3,
        title: 'Anxiety Worksheet',
        subtitle:
            '<span style="font-weight: 400;"><b style="font-weight: 900;">Facts</b> are verifiable statements.<br/><b>Opinions</b> are personal interpretations of facts, which differ from person to person.<br/><br/>For example, it is a fact that the sky is blue, and an opinion that the weather is beautiful.</span>',
        author: 'Karina Saraswati',
        authorHonorific: 'Dr.',
        notes: 'Please complete this assignment before our upcoming session.',
        type: AssignmentType.Facts_or_Opinion,
        preparations: [
          'Read each of statements and identify if they are <b>fact</b> or <b>opinion</b>.',
          'With practice, you can get better at spotting the difference between fact and opinion',
        ],
        totalPages: 5,
        duration: 30,
        worksheets: [
          PatientWorksheet(
            page: 0,
            title: 'Thoughts to be questioned:',
            subtitle: 'You can write anythings that comes on your mind.',
            hint: 'Write your thoughts here...',
            answer: 'Am I deserved to stay in my job?',
            modelAnswer: 'Am I deserved to stay in my job?',
          ),
          PatientWorksheet(
            page: 1,
            title: 'What is the evidence for this thought?',
            hint: 'Tell what you have found...',
            answer:
                'I feel that my education background doesn’t fit with my current job, so many targets that I haven’t achieve yet.',
            modelAnswer:
                'I feel that my education background doesn’t fit with my current job, so many targets that I haven’t achieve yet.',
          ),
          PatientWorksheet(
            page: 1,
            title: 'Am I basing this thought on facts, or on feelings?',
            hint: 'Tell what you have found...',
            answer: 'It’s currently 50:50 between facts or feelings.',
            modelAnswer: 'It’s currently 50:50 between facts or feelings.',
          ),
          PatientWorksheet(
            page: 1,
            title: 'Is this reality more complicated than the thought?',
            hint: 'Tell what you have found...',
            answer: 'Much more complicated.',
            modelAnswer: 'Much more complicated.',
          ),
          PatientWorksheet(
            page: 2,
            title: 'Could you be misinterpreting the evidence?',
            hint: 'Write your assumptions...',
            answer: 'Probably, it seems normal in my work environment.',
            modelAnswer: 'Probably, it seems normal in my work environment.',
          ),
          PatientWorksheet(
            page: 2,
            title: 'Might other people have different interpretations?',
            hint: 'Write your assumptions...',
            answer:
                'Possibly yes. Their role are far more higher/senior than my own, and they are probably have different views regarded to my work right now.',
            modelAnswer:
                'Possibly yes. Their role are far more higher/senior than my own, and they are probably have different views regarded to my work right now.',
          ),
          PatientWorksheet(
            page: 2,
            title: 'Am I looking at all the evidence?',
            subtitle:
                "This section is to make sure that you are sure with the evidence, and not just what supports your thought.",
            hint: 'Tell what you have found...',
            answer:
                'I don’t think I already seen all the evidences, and other perspective too. I feel that for now, I only accepted views that are similar to what I thoughts.',
            modelAnswer:
                'I don’t think I already seen all the evidences, and other perspective too. I feel that for now, I only accepted views that are similar to what I thoughts.',
          ),
          PatientWorksheet(
            page: 3,
            title: 'Could my thought be an exaggeration?',
            hint: 'Tell what you have found...',
            answer: 'Maybe',
            modelAnswer: 'Maybe',
          ),
          PatientWorksheet(
            page: 3,
            title: 'Am I having this thought our of habit?',
            subtitle:
                "You can tell what thoughts or which facts that support it.",
            hint: 'Tell what you have found...',
            answer:
                'I used to overthink a lot. But at some point, I can see and accept the facts that supports my thought.',
            modelAnswer:
                'I used to overthink a lot. But at some point, I can see and accept the facts that supports my thought.',
          ),
          PatientWorksheet(
            page: 3,
            title: 'Did someone pass this thought? Are they reliable?',
            hint: 'Tell what you have found...',
            answer:
                'Salah satu management pernah berkata kepadaku bahwa dia merasa cukup puas dengan hasil kerjaku akhir-akhir ini meskipun memang belum 100% tercapai. One of my boss said they I can work more on my job, especially what I did recently, even if it’s not a total 100% improvements',
            modelAnswer:
                'Salah satu management pernah berkata kepadaku bahwa dia merasa cukup puas dengan hasil kerjaku akhir-akhir ini meskipun memang belum 100% tercapai. One of my boss said they I can work more on my job, especially what I did recently, even if it’s not a total 100% improvements',
          ),
          PatientWorksheet(
            page: 4,
            title:
                'Is my thought a likely scenario?  Or is it the worst-case scenario?',
            hint: 'Re-confirming your thoughts again...',
            answer:
                'My thoughts are usually went to the worst-case possible scenario, and it could happen if I don’t do my job as good as possible.',
            modelAnswer:
                'My thoughts are usually went to the worst-case possible scenario, and it could happen if I don’t do my job as good as possible.',
          ),
        ],
        createdAt: DateTime.now(),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    patient = context.read<DoctorPatientListCubit>().state.patients.firstWhere(
          (element) => element.id == widget.patientId,
        );
  }

  Widget get zerothStep {
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
      appBar: AppBar(toolbarHeight: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        Text(
                          'Select Topics',
                          style: TextStyle(
                            fontSize: 22,
                            height: 28 / 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Rubik',
                            color: HexColor('#1D1B20'),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Wrap(
                spacing: 32,
                runSpacing: 16,
                children: [
                  {
                    'asset': 'assets/images/anxiety.png',
                    'text': 'Anxiety',
                  },
                  {
                    'asset': 'assets/images/cbt.png',
                    'text': 'CBT',
                  },
                  {
                    'asset': 'assets/images/depression.png',
                    'text': 'Depression',
                  },
                  {
                    'asset': 'assets/images/grief.png',
                    'text': 'Grief',
                  },
                  {
                    'asset': 'assets/images/parenting.png',
                    'text': 'Parenting & Behaviour',
                  },
                  {
                    'asset': 'assets/images/stress.png',
                    'text': 'Stress',
                  },
                ]
                    .map(
                      (e) => ChoiceCard(
                        boxSize:
                            (MediaQuery.of(context).size.width - 32) / 2 - 16,
                        asset: e['asset']!,
                        text: e['text']!,
                        onTap: () {
                          if (e['text'] == 'Anxiety') {
                            setState(() {
                              step = 1;
                              topic = "anxiety";
                            });
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get firstStep {
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
      appBar: AppBar(toolbarHeight: 0),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: worksheet.isEmpty,
          text: 'Confirm worksheet',
          onPressed: () {
            setState(() {
              step = 2;
            });
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              step = 0;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: HexColor('#1D1B20'),
                          ),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          'Select Worksheets',
                          style: TextStyle(
                            fontSize: 22,
                            height: 28 / 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Rubik',
                            color: HexColor('#1D1B20'),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
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
              child: InkWell(
                onTap: switchToSocratic,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      visualDensity: VisualDensity.compact,
                      value: 'socratic',
                      groupValue: worksheet,
                      onChanged: (p0) {},
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Heading(
                            text: 'Socratic Questions',
                            size: SizeOfThing.medium,
                          ),
                          Text(
                            'Help your brain to differentiate between facts or opinion statements.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: HexColor('#49454F'),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              child: InkWell(
                onTap: switchToFactOrOpinion,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      visualDensity: VisualDensity.compact,
                      value: 'fact_or_opinion',
                      groupValue: worksheet,
                      onChanged: (p0) {},
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Heading(
                            text: 'Fact or opinion',
                            size: SizeOfThing.medium,
                          ),
                          Text(
                            'Help your brain to differentiate between facts or opinion statements.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: HexColor('#49454F'),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   worksheet = 'automatic';
                  // });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      visualDensity: VisualDensity.compact,
                      value: 'automatic',
                      groupValue: worksheet,
                      onChanged: (p0) {},
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Heading(
                            text: 'Automatic thoughts',
                            size: SizeOfThing.medium,
                          ),
                          Text(
                            'Help your brain to differentiate between facts or opinion statements.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: HexColor('#49454F'),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get secondStep {
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
      appBar: AppBar(toolbarHeight: 0),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: worksheet.isEmpty,
          text: 'Submit & send',
          onPressed: () {
            context
                .read<DoctorPatientListCubit>()
                .addNewAssignment(patient.id, assignment);
            context.router.popForced();
            toastification.show(
              backgroundColor: HexColor('#E0E9E8'),
              showProgressBar: false,
              icon: const Icon(
                size: 0,
                Icons.check_circle,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(4),
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
                top: 16,
                bottom: 16,
              ),
              padding: const EdgeInsets.all(0),
              context: context, // optional if you use ToastificationWrapper
              title: const Text(
                'Assignment has been sent!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              autoCloseDuration: const Duration(seconds: 5),
              alignment: Alignment.bottomCenter,
            );
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                step = 1;
                              });
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: HexColor('#1D1B20'),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Text(
                            'Send assignment',
                            style: TextStyle(
                              fontSize: 22,
                              height: 28 / 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Rubik',
                              color: HexColor('#1D1B20'),
                              decoration: TextDecoration.none,
                            ),
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
                      const SizedBox(height: 8),
                      Text(
                        'Select other patient',
                        style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          color: HexColor('#6750A4'),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Label(
                  text: 'Worksheet',
                  size: SizeOfThing.large,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                color: HexColor('#F0EBE8'),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: MediaQuery.of(context).size.width - 32,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      step = 3;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: worksheet == 'fact_or_opinion',
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Heading(
                                text: 'Fact or opinion',
                                size: SizeOfThing.medium,
                              ),
                              Text(
                                'Help your brain to differentiate between facts or opinion statements.',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 20 / 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  color: HexColor('#49454F'),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: worksheet == 'socratic',
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Heading(
                                text: 'Socratic Questions',
                                size: SizeOfThing.medium,
                              ),
                              Text(
                                'Help your brain to differentiate between facts or opinion statements.',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 20 / 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  color: HexColor('#49454F'),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Label(
                  text: 'Estimated time',
                  size: SizeOfThing.large,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Body(
                  text: '30 minutes',
                  size: SizeOfThing.large,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Label(
                  text: 'Add notes',
                  size: SizeOfThing.large,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText:
                        'Please complete this assignment before our upcoming session. ',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor('#79747E')),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeColor.primary500, width: 2),
                    ),
                  ),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get thirdStep {
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
      appBar: AppBar(toolbarHeight: 0),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: worksheet.isEmpty,
          text: 'View worksheet sample',
          onPressed: () {
            setState(() {
              step = 4;
            });
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.router.popForced();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          'Assignment details',
                          style: TextStyle(
                            fontSize: 22,
                            height: 28 / 22,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: worksheet == 'fact_or_opinion',
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Display(
                              text: 'Fact or opinion'
                                  .replaceAll('AssignmentType.', '')
                                  .replaceAll('_', ' '),
                              size: SizeOfThing.small,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 16),
                            const HtmlWidget(
                              '<span style="font-weight: 400;"><b style="font-weight: 900;">Facts</b> are verifiable statements.<br/><b>Opinions</b> are personal interpretations of facts, which differ from person to person.<br/><br/>For example, it is a fact that the sky is blue, and an opinion that the weather is beautiful.</span>',
                              textStyle: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: worksheet == 'socratic',
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Display(
                              text: 'Socratic Questions'
                                  .replaceAll('AssignmentType.', '')
                                  .replaceAll('_', ' '),
                              size: SizeOfThing.small,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 16),
                            const HtmlWidget(
                              '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them.”',
                              textStyle: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'fact_or_opinion',
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Heading(
                      text: 'What do you need to prepare?',
                      size: SizeOfThing.small,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: ThemeColor.primary100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: HexColor('#21DB33'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: HtmlWidget(
                              'Read each of statements and identify if they are <b>fact</b> or <b>opinion</b>.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: ThemeColor.primary100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: HexColor('#21DB33'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: HtmlWidget(
                              'With practice, you can get better at spotting the difference between fact and opinion',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Heading(
                          text: 'Notes from ',
                          size: SizeOfThing.small,
                        ),
                        Heading(
                          text: 'Dr. Karina',
                          size: SizeOfThing.small,
                          color: HexColor('#6750A4'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Body(
                      text: 'Your notes will be showed here.',
                      size: SizeOfThing.large,
                    ),
                    const SizedBox(height: 16),
                    const Heading(
                      text: 'Estimated time',
                      size: SizeOfThing.small,
                    ),
                    const SizedBox(height: 8),
                    const Body(
                      text: '30 minutes',
                      size: SizeOfThing.large,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'socratic',
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Heading(
                      text: 'What do you need to prepare?',
                      size: SizeOfThing.small,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: ThemeColor.primary100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: HexColor('#21DB33'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: HtmlWidget(
                              'Spend a moment thinking about each of the following questions.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: ThemeColor.primary100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: HexColor('#21DB33'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: HtmlWidget(
                              'Record thorough responses carefully.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: ThemeColor.primary100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: HexColor('#21DB33'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: HtmlWidget(
                              'Elaborate, and explain “why” or “why not” in your response',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Heading(
                          text: 'Notes from ',
                          size: SizeOfThing.small,
                        ),
                        Heading(
                          text: 'Dr. Karina',
                          size: SizeOfThing.small,
                          color: HexColor('#6750A4'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Body(
                      text:
                          'Please complete this assignment before our upcoming session. ',
                      size: SizeOfThing.large,
                    ),
                    const SizedBox(height: 16),
                    const Heading(
                      text: 'Estimated time',
                      size: SizeOfThing.small,
                    ),
                    const SizedBox(height: 8),
                    const Body(
                      text: '30 minutes',
                      size: SizeOfThing.large,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get fourthStep {
    final currentPageQuestions =
        assignment.worksheets.where((element) => element.page == page);

    return Layout(
      bottomNavigationBar: Container(
        height: 130,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Visibility(
              visible: isReviewing,
              child: Expanded(
                child: PrimaryButton(
                  icon: Icons.arrow_back,
                  text: 'Review assignment',
                  onPressed: () {
                    setState(() {
                      page = assignment.worksheets.length - 1;
                      step = 5;
                      isReviewing = false;
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: !isReviewing,
              child: Expanded(
                child: PrimaryButton(
                  color: ThemeColor.primary500,
                  background: Colors.white,
                  icon: Icons.arrow_back,
                  text: page == 0 ? 'Back to assignment' : 'Previous statement',
                  onPressed: () {
                    setState(() {
                      if (page == 0) {
                        step = 3;
                        return;
                      } else {
                        page = page - 1;
                      }
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: !isReviewing,
              child: Expanded(
                child: PrimaryButton(
                  text: 'Continue',
                  onPressed: () {
                    // find largest page number in the assignment.worksheet
                    int maxPage = 0;

                    for (var worksheet in assignment.worksheets) {
                      if (worksheet.page > maxPage) {
                        maxPage = worksheet.page;
                      }
                    }

                    setState(() {
                      if (page < maxPage) {
                        page = page + 1;
                      } else {
                        step = 5;
                      }
                    });
                  },
                ),
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
            Visibility(
              visible: worksheet == 'fact_or_opinion',
              child: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 45),
                            Headline(
                              text: '"${currentPageQuestions.first.title}"',
                              color: Colors.white,
                              size: SizeOfThing.large,
                            ),
                            const SizedBox(height: 45),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'socratic' && page == 0,
              child: Container(
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
            ),
            Visibility(
              visible: worksheet == 'socratic' && page != 0,
              child: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 45),
                            const Heading(
                              text: 'Your thoughts are...',
                              color: Colors.white,
                              size: SizeOfThing.small,
                            ),
                            Display(
                              text:
                                  '"${assignment.worksheets.where((element) => element.page == 0).first.answer}"',
                              size: SizeOfThing.small,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 45),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'fact_or_opinion',
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Label(
                      text: 'This statement is',
                      size: SizeOfThing.large,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: HexColor('#F9F9F9'),
                      child: RadioListTile(
                        value: 'Fact',
                        groupValue: currentPageQuestions.first.answer,
                        onChanged: (p0) {
                          setState(() {
                            final newAnswer = assignment.copyWith(
                              worksheets:
                                  assignment.worksheets.map((worksheet) {
                                if (worksheet.page ==
                                    currentPageQuestions.first.page) {
                                  return worksheet.copyWith(answer: 'Fact');
                                }
                                return worksheet;
                              }).toList(),
                            );
                            assignment = newAnswer;
                          });
                        },
                        title: const Label(
                          text: 'Fact',
                          size: SizeOfThing.large,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: HexColor('#F9F9F9'),
                      child: RadioListTile(
                        value: 'Opinion',
                        groupValue: currentPageQuestions.first.answer,
                        onChanged: (p0) {
                          setState(() {
                            final newAnswer = assignment.copyWith(
                              worksheets:
                                  assignment.worksheets.map((worksheet) {
                                if (worksheet.page ==
                                    currentPageQuestions.first.page) {
                                  return worksheet.copyWith(answer: 'Opinion');
                                }
                                return worksheet;
                              }).toList(),
                            );
                            assignment = newAnswer;
                          });
                        },
                        title: const Label(
                          text: 'Opinion',
                          size: SizeOfThing.large,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'socratic' && page == 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    LabeledTextField(
                      answer: assignment.worksheets
                          .where((element) => element.page == 0)
                          .first
                          .answer,
                      title: assignment.worksheets
                          .where((element) => element.page == 0)
                          .first
                          .title,
                      hint: assignment.worksheets
                          .where((element) => element.page == 0)
                          .first
                          .hint,
                      subtitle: assignment.worksheets
                          .where((element) => element.page == 0)
                          .first
                          .subtitle,
                      onChanged: (p0) {
                        setState(() {
                          final newAnswer = assignment.copyWith(
                            worksheets: assignment.worksheets.map((worksheet) {
                              if (worksheet.page == 0) {
                                return worksheet.copyWith(answer: p0);
                              }
                              return worksheet;
                            }).toList(),
                          );
                          assignment = newAnswer;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: worksheet == 'socratic' && page != 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    ...currentPageQuestions.map(
                      (e) => LabeledTextField(
                        key: Key(e.title),
                        title: e.title,
                        answer: e.answer,
                        hint: e.hint,
                        subtitle: e.subtitle,
                        onChanged: (p0) {
                          setState(() {
                            final newAnswer = assignment.copyWith(
                              worksheets:
                                  assignment.worksheets.map((worksheet) {
                                if (worksheet.page == e.page) {
                                  return worksheet.copyWith(answer: p0);
                                }
                                return worksheet;
                              }).toList(),
                            );
                            assignment = newAnswer;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get fifthStep {
    final groupedAnswersByPage =
        groupBy(assignment.worksheets, (p0) => p0.page);

    return Layout(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          loading: isLoading,
          text: 'Return to assignment page',
          onPressed: () {
            setState(() {
              step = 2;
              page = 0;
            });
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
                            text: 'Review Assignments',
                            size: SizeOfThing.small,
                            color: Colors.white,
                          ),
                          SizedBox(height: 16),
                          Body(
                            text:
                                'You can revisit your answers before submitting this worksheet to your therapist. Please make sure you are answering the right questions.',
                            color: Colors.white,
                          ),
                          SizedBox(height: 32),
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
                  ...List.generate(
                    groupedAnswersByPage.length,
                    (index) => index,
                  ).map((e) {
                    final reviewPage = groupedAnswersByPage[e];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...reviewPage!.map((worksheet) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Body(
                                text: '"${worksheet.title}"',
                                size: SizeOfThing.large,
                                color: HexColor('#545454'),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: Heading(
                                      text: worksheet.answer,
                                      size: SizeOfThing.small,
                                      color: Colors.black,
                                    ),
                                  ),
                                  PrimaryButton(
                                    color: ThemeColor.primary500,
                                    background: Colors.white,
                                    icon: Icons.edit,
                                    text: 'Edit',
                                    onPressed: () {
                                      setState(() {
                                        step = 4;
                                        page = worksheet.page;
                                        isReviewing = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            color: HexColor('#EBEBEB'),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorPatientListCubit, DoctorPatientListState>(
      builder: (context, state) {
        switch (step) {
          case 0:
            return zerothStep;
          case 1:
            return firstStep;
          case 2:
            return secondStep;
          case 3:
            return thirdStep;
          case 4:
            return fourthStep;
          case 5:
            return fifthStep;
          default:
            return zerothStep;
        }
      },
    );
  }
}
