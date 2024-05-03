// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/ui/widgets/atom/mood_card.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientMoodTrackerScreen extends StatefulWidget {
  const PatientMoodTrackerScreen({super.key});

  @override
  State<PatientMoodTrackerScreen> createState() =>
      _PatientMoodTrackerScreenState();
}

class _PatientMoodTrackerScreenState extends State<PatientMoodTrackerScreen> {
  PatientMood? selectedMood;
  int page = 0;
  List<String> reasons = [];
  TextEditingController notesController = TextEditingController();
  bool loading = false;

  /// getter

  Widget get actionButton {
    if (page == 0) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          disabled: selectedMood == null,
          text: 'Set mood',
          onPressed: () {
            setState(() {
              page = 1;
            });
          },
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          loading: loading,
          text: 'Update mood',
          onPressed: () async {
            setState(() {
              loading = true;
            });

            context.read<PatientMoodTrackerCubit>().addMood(
                  PatientMood(
                    id: context.read<PatientMoodTrackerCubit>().latestId + 1,
                    mood: selectedMood!.mood,
                    reasons: reasons,
                    notes: notesController.text,
                    date: DateTime.now(),
                    emoji: selectedMood!.emoji,
                    colorHex: selectedMood!.colorHex,
                    backgroundHexStart: selectedMood!.backgroundHexStart,
                    backgroundHexEnd: selectedMood!.backgroundHexEnd,
                    moodText: selectedMood!.moodText,
                  ),
                );

            await Future.delayed(const Duration(milliseconds: 500));

            context.router.popForced();
          },
        ),
      );
    }
  }

  Widget get leadingButton {
    if (page == 0) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.router.popForced();
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            page = 0;
          });
        },
      );
    }
  }

  Widget get moodSelection {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.grey[100]!.withOpacity(0.5),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Headline(text: 'How do you feel today?'),
          const SizedBox(height: 8),
          const Body(text: 'Select which mood that really describes yours.'),
          const SizedBox(height: 24),
          Wrap(
            runSpacing: 24,
            spacing: 16,
            children: [
              PatientMood(
                id: -1,
                emoji: '🙂',
                colorHex: '#004895',
                backgroundHexStart: '#80DEF8',
                backgroundHexEnd: '#80F8CA',
                mood: 'happy',
                moodText: 'Happy!',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😊',
                colorHex: '#FFFFFF',
                backgroundHexStart: '#B280F8',
                backgroundHexEnd: '#D680F8',
                mood: 'surprised',
                moodText: 'Surprised',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😐',
                colorHex: '#1B1B1B',
                backgroundHexStart: '#ECECEC',
                backgroundHexEnd: '#D1D1D1',
                mood: 'just_ok',
                moodText: 'Just OK',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😭',
                colorHex: '#F6F6F6',
                backgroundHexStart: '#3A3A3A',
                backgroundHexEnd: '#252525',
                mood: 'sad',
                moodText: 'Sad',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '🙁',
                colorHex: '#954D00',
                backgroundHexStart: '#F8E280',
                backgroundHexEnd: '#F8BE80',
                mood: 'fearful',
                moodText: 'Fearful',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😡',
                colorHex: '#FFFFFF',
                backgroundHexStart: '#F8808A',
                backgroundHexEnd: '#F89A80',
                mood: 'angry',
                moodText: 'Angry',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
            ]
                .map(
                  (mood) => MoodCard(
                    key: Key('${mood.mood}${selectedMood?.mood ?? ''}'),
                    text: mood.moodText,
                    emoji: mood.emoji,
                    color: HexColor(mood.colorHex),
                    backgroundStart: HexColor(mood.backgroundHexStart),
                    backgroundEnd: HexColor(mood.backgroundHexEnd),
                    selected: isMoodSelected(mood),
                    onTap: () {
                      setMood(mood);
                    },
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget get moodReasoning {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor(selectedMood?.backgroundHexStart ?? '#FFFFFF'),
                HexColor(selectedMood?.backgroundHexEnd ?? '#FFFFFF'),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Headline(
                text: "You're feeling...",
                color: HexColor(selectedMood?.colorHex ?? '#000000'),
                size: SizeOfThing.small,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headline(
                    text: selectedMood?.emoji ?? '',
                    size: SizeOfThing.large,
                  ),
                  const SizedBox(width: 8),
                  Heading(
                    text: selectedMood?.moodText ?? '',
                    size: SizeOfThing.large,
                    color: HexColor(selectedMood?.colorHex ?? '#000000'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !['just_ok', 'angry'].contains(selectedMood?.mood),
                child: Label(
                  text:
                      'What makes you ${(selectedMood?.mood ?? '').replaceAll('_', ' ')} today?',
                  size: SizeOfThing.large,
                ),
              ),
              Visibility(
                visible: selectedMood?.mood == 'just_ok',
                child: const Label(
                  text: 'What is the reason for today’s feeling?',
                  size: SizeOfThing.large,
                ),
              ),
              Visibility(
                visible: selectedMood?.mood == 'angry',
                child: const Label(
                  text: 'What is the reason feeling like it today?',
                  size: SizeOfThing.large,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Personal',
                  'Work',
                  'Family',
                  'Study',
                  'Friends',
                  'Food',
                  'Environment',
                  'Social',
                  'Relationship',
                  'Music',
                  'Movies/TV',
                  'Outdoor activities',
                ]
                    .map(
                      (reason) => Chips(
                        key: Key(reason),
                        text: reason,
                        selected: reasons.contains(reason),
                        onPressed: () {
                          setState(() {
                            if (reasons.contains(reason)) {
                              reasons.remove(reason);
                            } else {
                              reasons.add(reason);
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              const Label(
                text: 'Notes',
                size: SizeOfThing.large,
              ),
              const SizedBox(height: 8),
              TextField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: notesController,
                decoration: InputDecoration(
                  hintText: "Express your feelings...",
                  fillColor: HexColor('#FFFFFF'),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
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
            ],
          ),
        ),
      ],
    );
  }

  /// functions
  bool isMoodSelected(PatientMood mood) {
    return selectedMood?.mood == mood.mood;
  }

  void setMood(PatientMood mood) {
    setState(() {
      selectedMood = mood;
    });
  }

  @override
  void dispose() {
    notesController.dispose();
    page = 0;
    selectedMood = null;
    reasons = [];

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: AppBar(
        title: const Text('Mood tracker'),
        leading: leadingButton,
      ),
      bottomNavigationBar: actionButton,
      child: SingleChildScrollView(
        child: page == 0 ? moodSelection : moodReasoning,
      ),
    );
  }
}
