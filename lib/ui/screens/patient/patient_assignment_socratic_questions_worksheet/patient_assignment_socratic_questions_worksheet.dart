import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/screens/patient/patient_assignment_socratic_questions_worksheet/widgets/widgets.dart';
import 'package:lightenup/ui/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class PatientAssignmentSocratesQuestionsScreen extends StatefulWidget {
  const PatientAssignmentSocratesQuestionsScreen({
    required this.assignment,
    super.key,
  });

  final PatientAssignment assignment;

  @override
  State<PatientAssignmentSocratesQuestionsScreen> createState() =>
      _PatientAssignmentSocratesQuestionsScreenState();
}

class _PatientAssignmentSocratesQuestionsScreenState
    extends State<PatientAssignmentSocratesQuestionsScreen> {
  late PatientAssignmentAnswer answer;
  int page = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    answer = PatientAssignmentAnswer(
      assignmentId: widget.assignment.id,
      worksheets: widget.assignment.worksheets,
      date: DateTime.now(),
    );
  }

  Widget get firstPage {
    final firstPageQuestion =
        answer.worksheets.firstWhere((element) => element.page == 0);

    return Layout(
      bottomNavigationBar: Container(
        height: 130,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                disabled: firstPageQuestion.answer.isEmpty,
                text: 'Submit thoughts',
                onPressed: () {
                  setState(() {
                    page = 1;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                color: ThemeColor.primary500,
                background: Colors.white,
                text: 'Abort assignments',
                onPressed: () {
                  context.router.popForced();
                },
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  LabeledTextField(
                    answer: firstPageQuestion.answer,
                    title: firstPageQuestion.title,
                    hint: firstPageQuestion.hint,
                    subtitle: firstPageQuestion.subtitle,
                    onChanged: (p0) {
                      setState(() {
                        final newAnswer = answer.copyWith(
                          worksheets: answer.worksheets.map((worksheet) {
                            if (worksheet.page == 0) {
                              return worksheet.copyWith(answer: p0);
                            }
                            return worksheet;
                          }).toList(),
                        );
                        answer = newAnswer;
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

  Widget get contentPage {
    final firstPageQuestion =
        answer.worksheets.firstWhere((element) => element.page == 0);
    final currentPageQuestions =
        answer.worksheets.where((element) => element.page == page);
    final allAnswered =
        currentPageQuestions.every((element) => element.answer.isNotEmpty);

    return Layout(
      bottomNavigationBar: Container(
        height: 130,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButton(
                color: ThemeColor.primary500,
                background: Colors.white,
                icon: Icons.arrow_back,
                text: 'Back to thoughts',
                onPressed: () {
                  setState(() {
                    page = page - 1;
                  });
                },
              ),
            ),
            Expanded(
              child: PrimaryButton(
                disabled: !allAnswered,
                text: 'Continue',
                onPressed: () {
                  // find largest page number in the assignment.worksheet
                  int maxPage = 0;

                  for (var worksheet in answer.worksheets) {
                    if (worksheet.page > maxPage) {
                      maxPage = worksheet.page;
                    }
                  }

                  setState(() {
                    if (page < maxPage) {
                      page = page + 1;
                    } else {
                      page = -1;
                    }
                  });
                },
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
                            text: '"${firstPageQuestion.answer}"',
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
            Padding(
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
                          final newAnswer = answer.copyWith(
                            worksheets: answer.worksheets.map((worksheet) {
                              if (worksheet.page == e.page) {
                                return worksheet.copyWith(answer: p0);
                              }
                              return worksheet;
                            }).toList(),
                          );
                          answer = newAnswer;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get summaryPage {
    final groupedAnswersByPage = groupBy(answer.worksheets, (p0) => p0.page);

    return Layout(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          loading: isLoading,
          text: 'Submit & send assignment',
          onPressed: () {
            setState(() {
              isLoading = true;
            });

            Future.delayed(const Duration(milliseconds: 500), () {
              context
                  .read<PatientAssignmentCubit>()
                  .addAssignmentAnswer(answer);
              context
                  .read<PatientAssignmentCubit>()
                  .setCompletedAssignments(answer.assignmentId);
              context.router
                  .popUntilRouteWithName(PatientAssignmentListRoute.name);

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
                  'Assignment submitted!',
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
                    final page = groupedAnswersByPage[e];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...page!.map(
                          (worksheet) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Heading(
                                text: worksheet.title,
                                size: SizeOfThing.small,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 4),
                              Body(
                                text: worksheet.answer,
                                size: SizeOfThing.small,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
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
    switch (page) {
      case -1:
        return summaryPage;

      case 0:
        return firstPage;
      default:
        return contentPage;
    }
  }
}
