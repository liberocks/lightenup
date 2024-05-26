import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/data/model/model.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientAssignmentDetailScreen extends StatelessWidget {
  const PatientAssignmentDetailScreen({
    required this.assignment,
    super.key,
  });

  final PatientAssignment assignment;

  @override
  Widget build(BuildContext context) {
    return Layout(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: 'Start assigments',
          onPressed: () {
            if (assignment.type == AssignmentType.Socratic_Questions) {
              AutoRouter.of(context).push(
                PatientAssignmentSocratesQuestionsRoute(
                  assignment: assignment,
                ),
              );
            } else if (assignment.type == AssignmentType.Facts_or_Opinion) {
              AutoRouter.of(context).push(
                PatientAssignmentFactOrOpinionRoute(
                  assignment: assignment,
                ),
              );
            }
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Display(
                            text: assignment.type
                                .toString()
                                .replaceAll('AssignmentType.', '')
                                .replaceAll('_', ' '),
                            size: SizeOfThing.small,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          HtmlWidget(
                            assignment.subtitle,
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Heading(
                    text: 'Given by',
                    size: SizeOfThing.small,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ThemeColor.primary500,
                        radius: 20,
                        child: Body(
                          text: assignment.author[0],
                          color: Colors.white,
                          size: SizeOfThing.large,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Body(
                          text: assignment.author,
                          size: SizeOfThing.large,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Heading(
                    text: 'What do you need to prepare?',
                    size: SizeOfThing.small,
                  ),
                  const SizedBox(height: 16),
                  ...assignment.preparations
                      .map(
                        (preparation) => [
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
                                Expanded(
                                  child: HtmlWidget(preparation),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      )
                      .expand((i) => i),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Heading(
                        text: 'Notes from ',
                        size: SizeOfThing.small,
                      ),
                      Heading(
                        text:
                            '${assignment.authorHonorific}${assignment.authorHonorific != null ? ' ' : ''}${assignment.author.split(' ')[0]}',
                        size: SizeOfThing.small,
                        color: HexColor('#6750A4'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Body(text: assignment.notes ?? '', size: SizeOfThing.large),
                  const SizedBox(height: 16),
                  const Heading(
                    text: 'Estimated time',
                    size: SizeOfThing.small,
                  ),
                  const SizedBox(height: 8),
                  Body(
                    text: assignment.duration > 1
                        ? '${assignment.duration} minutes'
                        : '${assignment.duration} minute',
                    size: SizeOfThing.large,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
