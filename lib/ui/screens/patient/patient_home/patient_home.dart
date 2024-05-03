import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        return BlocBuilder<PatientMoodTrackerCubit, PatientMoodTrackerState>(
          builder: (context, patientMoodTrackerState) {
            final appBarHeight = 196 - MediaQuery.of(context).viewPadding.top;

            final patientMood = context
                .read<PatientMoodTrackerCubit>()
                .getMoodByDate(DateTime.now());

            return Layout(
              onInit: () {
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.manual,
                  overlays: [SystemUiOverlay.bottom],
                );
              },
              appBar: AppBar(
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                leading: Container(),
                leadingWidth: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
              ),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: appBarHeight,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ThemeColor.gradientStart,
                              ThemeColor.gradientEnd,
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(32.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Headline(
                                text: 'Good morning ☀️',
                                size: SizeOfThing.small,
                              ),
                              Display(text: 'Adellia'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Heading(text: "Today's mood"),
                            Visibility(
                              visible: patientMood == null,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: const EmptyCard(
                                  'Start your day with daily check in!',
                                ),
                              ),
                            ),
                            Visibility(
                              visible: patientMood != null,
                              child: InkWell(
                                onLongPress: () {
                                  context
                                      .read<PatientMoodTrackerCubit>()
                                      .removeMood(patientMood!.id);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 96,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: HexColor(
                                        patientMood?.backgroundHexStart ??
                                            '#F0F0F0',
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Text(
                                            patientMood?.emoji ?? '',
                                            style:
                                                const TextStyle(fontSize: 36),
                                          ),
                                          const SizedBox(width: 16),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: HexColor(
                                                  patientMood?.colorHex ??
                                                      '#000000',
                                                ),
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: 'You are feeling ',
                                                ),
                                                TextSpan(
                                                  text: patientMood?.moodText,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: patientMood == null,
                              child: SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  text: 'Check in now',
                                  onPressed: () {
                                    AutoRouter.of(context)
                                        .push(const PatientMoodTrackerRoute());
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: patientMood != null,
                              child: SizedBox(
                                width: double.infinity,
                                child: SecondaryButton(
                                  text: 'View mood history',
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Heading(text: "What to do"),
                            const TodoCard(
                              title: 'Set mood tracker',
                              subtitle:
                                  'Tracking your feelings regularly would help your therapist to suggest what’s best for you.',
                              icon: Icons.person_outline,
                            ),
                            TodoCard(
                              title: 'Clear all assignment',
                              subtitle:
                                  'Make sure you finished the given worksheet from your previous session.',
                              icon: Icons.person_outline,
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const PatientAssignmentListRoute());
                              },
                            ),
                            const TodoCard(
                              title: 'Do more activities',
                              subtitle:
                                  'Remember to get up and find other activities to do besides your regular one.',
                              icon: Icons.person_outline,
                            ),
                            const SizedBox(height: 60),
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
      },
    );
  }
}
