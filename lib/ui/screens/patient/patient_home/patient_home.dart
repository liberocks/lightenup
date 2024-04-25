import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        final appBarHeight = 196 - MediaQuery.of(context).viewPadding.top;

        return Layout(
          appBar: AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: appBarHeight,
            title: Container(
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
                    Display(text: 'Chris H.'),
                  ],
                ),
              ),
            ),
            leading: Container(),
            leadingWidth: 0,
          ),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Heading(text: "Today's mood"),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedBorder(
                        dashPattern: const [4, 2],
                        color: Colors.grey[500]!,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        child: Container(
                          alignment: Alignment.center,
                          height: 96,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Body(
                            text: 'Start your day with daily check in!',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: 'Check in now',
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(const PatientMoodTrackerRoute());
                        },
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
                      onTap: () {},
                    ),
                    const TodoCard(
                      title: 'Do more activities',
                      subtitle:
                          'Remember to get up and find other activities to do besides your regular one.',
                      icon: Icons.person_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
