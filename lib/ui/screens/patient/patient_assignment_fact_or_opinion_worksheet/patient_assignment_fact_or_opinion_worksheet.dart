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
import 'package:lightenup/ui/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class PatientAssignmentFactOrOpinionScreen extends StatefulWidget {
  const PatientAssignmentFactOrOpinionScreen({
    required this.assignment,
    super.key,
  });

  final PatientAssignment assignment;

  @override
  State<PatientAssignmentFactOrOpinionScreen> createState() =>
      _PatientAssignmentFactOrOpinionScreenState();
}

class _PatientAssignmentFactOrOpinionScreenState
    extends State<PatientAssignmentFactOrOpinionScreen> {
  late PatientAssignmentAnswer answer;
  int page = 0;
  bool isLoading = false;
  bool isReviewing = false;

  @override
  void initState() {
    super.initState();

    answer = PatientAssignmentAnswer(
      assignmentId: widget.assignment.id,
      worksheets: widget.assignment.worksheets,
      date: DateTime.now(),
    );
  }

  Widget get contentPage {
    final currentPageQuestions =
        answer.worksheets.where((element) => element.page == page);
    final allAnswered =
        currentPageQuestions.every((element) => element.answer.isNotEmpty);

    return Layout(
      bottomNavigationBar: Container(
        color: Colors.white,
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
                      page = -1;
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
                        context.router.popForced();
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
            Container(
              color: Colors.white,
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
                          final newAnswer = answer.copyWith(
                            worksheets: answer.worksheets.map((worksheet) {
                              if (worksheet.page ==
                                  currentPageQuestions.first.page) {
                                return worksheet.copyWith(answer: 'Fact');
                              }
                              return worksheet;
                            }).toList(),
                          );
                          answer = newAnswer;
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
                          final newAnswer = answer.copyWith(
                            worksheets: answer.worksheets.map((worksheet) {
                              if (worksheet.page ==
                                  currentPageQuestions.first.page) {
                                return worksheet.copyWith(answer: 'Opinion');
                              }
                              return worksheet;
                            }).toList(),
                          );
                          answer = newAnswer;
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
    switch (page) {
      case -1:
        return summaryPage;

      default:
        return contentPage;
    }
  }
}
