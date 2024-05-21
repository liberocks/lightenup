import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
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
  String topic = "";
  String worksheet = "";
  late Patient patient;

  @override
  void initState() {
    super.initState();

    patient = context.read<DoctorPatientListCubit>().state.patients.firstWhere(
          (element) => element.id == widget.patientId,
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
      appBar: AppBar(
        toolbarHeight: 0,
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
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/anxiety.png',
                    text: 'Anxiety',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "anxiety";
                      });
                    },
                  ),
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/depression.png',
                    text: 'Depression',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "depression";
                      });
                    },
                  ),
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/cbt.png',
                    text: 'CBT',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "cbt";
                      });
                    },
                  ),
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/grief.png',
                    text: 'Grief',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "grief";
                      });
                    },
                  ),
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/parenting.png',
                    text: 'Parenting & Behaviour',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "parenting_and_behaviour";
                      });
                    },
                  ),
                  ChoiceCard(
                    boxSize: (MediaQuery.of(context).size.width - 32) / 2 - 16,
                    asset: 'assets/images/stress.png',
                    text: 'Stress',
                    onTap: () {
                      setState(() {
                        step = 1;
                        topic = "stress";
                      });
                    },
                  ),
                ],
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
      appBar: AppBar(
        toolbarHeight: 0,
      ),
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
                onTap: () {
                  setState(() {
                    worksheet = 'socratic';
                  });
                },
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
                onTap: () {
                  setState(() {
                    worksheet = 'automatic';
                  });
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
            const SizedBox(height: 16),
            Container(
              color: HexColor('#F0EBE8'),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: MediaQuery.of(context).size.width - 32,
              child: InkWell(
                onTap: () {
                  setState(() {
                    worksheet = 'fact_or_opinion';
                  });
                },
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
          ],
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
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: worksheet.isEmpty,
          text: 'Submit & send',
          onPressed: () {
            setState(() {
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
            });
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
                        backgroundImage: NetworkImage(
                          patient.profilePicture,
                        ),
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
                      worksheet = 'fact_or_opinion';
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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

  Widget get fourthStep {
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
        toolbarHeight: 0,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: worksheet.isEmpty,
          text: 'View worksheet sample',
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
                              step = 2;
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
                onTap: () {
                  setState(() {
                    worksheet = 'socratic';
                  });
                },
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
                onTap: () {
                  setState(() {
                    worksheet = 'automatic';
                  });
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
            const SizedBox(height: 16),
            Container(
              color: HexColor('#F0EBE8'),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: MediaQuery.of(context).size.width - 32,
              child: InkWell(
                onTap: () {
                  setState(() {
                    worksheet = 'fact_or_opinion';
                  });
                },
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorPatientListCubit, DoctorPatientListState>(
      builder: (context, state) {
        return step == 0
            ? firstStep
            : step == 1
                ? secondStep
                : step == 2
                    ? thirdStep
                    : fourthStep;
      },
    );
  }
}
