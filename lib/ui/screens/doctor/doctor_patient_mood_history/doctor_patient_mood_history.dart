import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/ext/datetime.dart';
import 'package:lightenup/ui/screens/patient/patient_mood_history/widgets/chart.dart';
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
  DateTime selectedDate = DateTime.now();
  int selectedIndex = DateTime.now().weekday - 1;
  List<PatientMood> moods = [];

  List<PatientMood> randomizeAnswers(DateTime currentDate) {
    final pregeneratedAnswer = [
      PatientMood(
        id: -1,
        emoji: '🙂',
        moodValue: 0,
        colorHex: '#004895',
        backgroundHexStart: '#80DEF8',
        backgroundHexEnd: '#80F8CA',
        mood: 'happy',
        moodText: 'Happy!',
        notes:
            'I am feeling great today! I had a good day at work and I am excited for the weekend!',
        reasons: ['Social', 'Work', 'Family', 'Health'],
        date: DateTime.now(),
      ),
      PatientMood(
        id: -1,
        emoji: '😊',
        moodValue: 1,
        colorHex: '#FFFFFF',
        backgroundHexStart: '#B280F8',
        backgroundHexEnd: '#D680F8',
        mood: 'surprised',
        moodText: 'Surprised',
        notes:
            'In the morning, I received a surprise gift from my friend. It made my day!',
        reasons: ['Food', 'School', 'Work', 'Family', 'Health'],
        date: DateTime.now(),
      ),
      PatientMood(
        id: -1,
        emoji: '😐',
        moodValue: 2,
        colorHex: '#1B1B1B',
        backgroundHexStart: '#ECECEC',
        backgroundHexEnd: '#D1D1D1',
        mood: 'just_ok',
        moodText: 'Just OK',
        notes:
            'I managed to finish my work today, but I am feeling a bit tired. I will take a rest tonight.',
        reasons: ['Sport'],
        date: DateTime.now(),
      ),
      PatientMood(
        id: -1,
        emoji: '😭',
        moodValue: 3,
        colorHex: '#F6F6F6',
        backgroundHexStart: '#3A3A3A',
        backgroundHexEnd: '#252525',
        mood: 'sad',
        moodText: 'Sad',
        notes:
            'My friend is moving to another city. I will miss her so much. I feel so sad today.',
        reasons: ['School', 'Friend'],
        date: DateTime.now(),
      ),
      PatientMood(
        id: -1,
        emoji: '🙁',
        moodValue: 4,
        colorHex: '#954D00',
        backgroundHexStart: '#F8E280',
        backgroundHexEnd: '#F8BE80',
        mood: 'fearful',
        moodText: 'Fearful',
        notes:
            'People are talking about the pandemic again. I am scared that I will get sick. I am feeling fearful today.',
        reasons: ['Social', 'News'],
        date: DateTime.now(),
      ),
      PatientMood(
        id: -1,
        emoji: '😡',
        moodValue: 5,
        colorHex: '#FFFFFF',
        backgroundHexStart: '#F8808A',
        backgroundHexEnd: '#F89A80',
        mood: 'angry',
        moodText: 'Angry',
        notes:
            'There were some arguments at work today. I am feeling angry and frustrated. I need to calm down.',
        reasons: ['Work'],
        date: DateTime.now(),
      ),
    ];

    final randomizedMood = List<int>.generate(7, (index) => index).map(
      (index) {
        final randomIndex = Random.secure().nextInt(5);

        DateTime date = currentDate;

        if (index == 6) {
          date = currentDate.lastDayOfWeek().add(const Duration(days: 1));
        }

        return PatientMood(
          id: -1,
          emoji: pregeneratedAnswer[randomIndex].emoji,
          moodValue: pregeneratedAnswer[randomIndex].moodValue,
          colorHex: pregeneratedAnswer[randomIndex].colorHex,
          backgroundHexStart:
              pregeneratedAnswer[randomIndex].backgroundHexStart,
          backgroundHexEnd: pregeneratedAnswer[randomIndex].backgroundHexEnd,
          mood: pregeneratedAnswer[randomIndex].mood,
          moodText: pregeneratedAnswer[randomIndex].moodText,
          notes: pregeneratedAnswer[randomIndex].notes,
          reasons: pregeneratedAnswer[randomIndex].reasons,
          date: date,
        );
      },
    ).toList();

    return randomizedMood;
  }

  @override
  void initState() {
    super.initState();
    moods = randomizeAnswers(selectedDate);
  }

  List<int> get getAnswers {
    List<int> answers = [-1, -1, -1, -1, -1, -1, -1];

    for (var i = 0; i < 7; i++) {
      answers[i] = moods[i].moodValue;
    }

    return answers;
  }

  String getEmoji(int value) {
    if (value == 0) {
      return '🙂';
    } else if (value == 1) {
      return '😊';
    } else if (value == 2) {
      return '😐';
    } else if (value == 3) {
      return '😭';
    } else if (value == 4) {
      return '🙁';
    } else if (value == 5) {
      return '😡';
    } else {
      return '';
    }
  }

  double getEmojiPadding(int value) {
    if (value == 0) {
      return 20;
    } else if (value == 1) {
      return 50;
    } else if (value == 2) {
      return 75;
    } else if (value == 3) {
      return 100;
    } else if (value == 4) {
      return 130;
    } else if (value == 5) {
      return 150;
    } else {
      return 0;
    }
  }

  String get getCalendarTitle {
    final startOfTheWeek = selectedDate.firstDayOfWeek();
    final endOfTheWeek = selectedDate.lastDayOfWeek();

    final isSameMonth = !selectedDate.hasMonthTransitionInTheWeek();

    if (isSameMonth) {
      return '${startOfTheWeek.format(pattern: 'dd')} - ${endOfTheWeek.format(pattern: 'dd MMM yyyy')}';
    } else {
      return '${startOfTheWeek.format(pattern: 'dd MMM')} - ${endOfTheWeek.format(pattern: 'dd MMM yyyy')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
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
                context.router.popForced();
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
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              setState(() {
                                selectedDate = selectedDate.previousWeek();
                                moods = randomizeAnswers(selectedDate);
                              });
                            },
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Label(
                                text: getCalendarTitle,
                                size: SizeOfThing.large,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: () {
                              setState(() {
                                selectedDate = selectedDate.nextWeek();
                                moods = randomizeAnswers(selectedDate);
                              });
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
                            children: List<int>.generate(7, (index) => index)
                                .map(
                                  (index) => Container(
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width -
                                            34) /
                                        7,
                                    color: selectedIndex == index
                                        ? HexColor('#DACAFD')
                                        : index % 2 == 0
                                            ? HexColor('#F6F6F6')
                                            : HexColor('#EFEFEF'),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomPaint(
                          painter: Chart(getAnswers),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 200,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: getAnswers
                              .map(
                                (e) => Container(
                                  height: 200,
                                  width:
                                      (MediaQuery.of(context).size.width - 34) /
                                          7,
                                  padding: EdgeInsets.only(
                                    top: getEmojiPadding(e),
                                  ),
                                  alignment: Alignment.topCenter,
                                  child: Heading(
                                    text: getEmoji(e),
                                    size: SizeOfThing.large,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: List<int>.generate(7, (index) => index)
                              .map(
                                (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width -
                                            34) /
                                        7,
                                    color: Colors.transparent,
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
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(1)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(2)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(3)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(4)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(5)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .weekdayOf(6)
                                  .format(pattern: 'dd/MM'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Body(
                              text: selectedDate
                                  .add(const Duration(days: 7))
                                  .weekdayOf(0)
                                  .format(pattern: 'dd/MM'),
                            ),
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
                              gradient: LinearGradient(
                                colors: [
                                  HexColor(
                                    moods[selectedIndex].backgroundHexStart,
                                  ),
                                  HexColor(
                                    moods[selectedIndex].backgroundHexEnd,
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
                                    moods[selectedIndex].emoji,
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Label(
                                        text: 'You feel...',
                                        color: HexColor(
                                          moods[selectedIndex].colorHex,
                                        ),
                                      ),
                                      Body(
                                        text: moods[selectedIndex].moodText,
                                        size: SizeOfThing.large,
                                        color: HexColor(
                                          moods[selectedIndex].colorHex,
                                        ),
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
                          children: moods[selectedIndex]
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
                          text: moods[selectedIndex].notes,
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
