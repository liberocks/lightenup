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
                    backgroundHex: selectedMood!.backgroundHex,
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
                backgroundHex: '#BAF0FF',
                mood: 'happy',
                moodText: 'Happy!',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😊',
                colorHex: '#3E0095',
                backgroundHex: '#C2BAFF',
                mood: 'surprised',
                moodText: 'Surprised',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😐',
                colorHex: '#4B4B4B',
                backgroundHex: '#E9E9E9',
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
                backgroundHex: '#808080',
                mood: 'sad',
                moodText: 'Sad',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '🙁',
                colorHex: '#606C00',
                backgroundHex: '#FFDEBA',
                mood: 'fearful',
                moodText: 'Fearful',
                notes: '',
                reasons: [],
                date: DateTime.now(),
              ),
              PatientMood(
                id: -1,
                emoji: '😡',
                colorHex: '#6C1700',
                backgroundHex: '#FFBAC0',
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
                    background: HexColor(mood.backgroundHex),
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
                HexColor('#80DEF8'),
                HexColor('#80F8CA'),
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
                color: HexColor('#004895'),
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
              Label(
                text: 'What makes you ${selectedMood?.mood} today?',
                size: SizeOfThing.large,
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
                  hintText: "I'm feeling better than usual...",
                  fillColor: HexColor('#E6E0E9'),
                  filled: true,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#49454F')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#6750A4')),
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
