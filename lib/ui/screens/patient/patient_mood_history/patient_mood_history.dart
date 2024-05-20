import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/screens/patient/patient_mood_history/widgets/chart.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientMoodHistoryScreen extends StatelessWidget {
  const PatientMoodHistoryScreen({
    super.key,
  });

  String getEmoji(double value) {
    if (value.toInt() == 0) {
      return '🙂';
    } else if (value.toInt() == 1.0) {
      return '😊';
    } else if (value.toInt() == 2.0) {
      return '😐';
    } else if (value.toInt() == 3.0) {
      return '😭';
    } else if (value.toInt() == 4.0) {
      return '🙁';
    } else {
      return '😡';
    }
  }

  double getEmojiPadding(double value) {
    if (value < 1.0) {
      return 20;
    } else if (value < 2.0) {
      return 50;
    } else if (value < 3.0) {
      return 80;
    } else if (value < 4.0) {
      return 100;
    } else if (value < 5.0) {
      return 130;
    } else {
      return 150;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        final feelings = [0.0, 5.0, 2.0, 3.0, 4.0, 5.0, 1.0];

        return Layout(
          onInit: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom],
            );
          },
          appBar: AppBar(
            title: const Text('Tracker Log'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<PatientNavigationCubit>().switchToHome();
              },
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              context
                                  .read<PatientNavigationCubit>()
                                  .switchToHome();
                            },
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Label(
                                text: '29 Apr - 5 May 2024',
                                size: SizeOfThing.large,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: () {
                              context
                                  .read<PatientNavigationCubit>()
                                  .switchToHome();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: HexColor('#E6E6E6'),
                                width: 2,
                              ),
                              left: BorderSide(
                                color: HexColor('#E6E6E6'),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#F6F6F6'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#EFEFEF'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#F6F6F6'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#EFEFEF'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#F6F6F6'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#EFEFEF'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  color: HexColor('#F6F6F6'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomPaint(
                          painter: Chart(feelings),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 200,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: feelings
                              .map(
                                (e) => Expanded(
                                  child: Container(
                                    height: 200,
                                    padding: EdgeInsets.only(
                                      top: getEmojiPadding(e),
                                    ),
                                    alignment: Alignment.topCenter,
                                    child: Heading(
                                      text: getEmoji(e),
                                      size: SizeOfThing.large,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Body(text: '29/04'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(
                          text: 'Report',
                          size: SizeOfThing.medium,
                          color: HexColor('#240046'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 96,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: HexColor(
                                '#80def8',
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: const Row(
                                children: [
                                  Text(
                                    '😀',
                                    style: TextStyle(fontSize: 36),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Label(text: 'You feel...'),
                                      Body(
                                        text: 'Fearful',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Label(text: 'Reason:', size: SizeOfThing.large),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                            Chips(
                              text: 'Social',
                              borderColor: Colors.transparent,
                              selected: false,
                              color: Colors.black,
                              background: HexColor('#E6E6E6'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Label(text: 'Notes', size: SizeOfThing.large),
                        const SizedBox(height: 8),
                        const Body(
                          text:
                              'I just spend time with school friends today. We ate good foods and I’m feeling better.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
