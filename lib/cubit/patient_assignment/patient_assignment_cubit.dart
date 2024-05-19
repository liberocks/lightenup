import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lightenup/constants/constants.dart';

import 'package:lightenup/cubit/patient_assignment/patient_assignment_state.dart';
import 'package:lightenup/data/model/model.dart';

class PatientAssignmentCubit extends HydratedCubit<PatientAssignmentState> {
  PatientAssignmentCubit() : super(const PatientAssignmentState.initial());

  /// demo
  void resetDemo() {
    emit(
      state.copyWith(
        assignmentAnswers: [],
        assignments: [
          PatientAssignment(
            id: 1,
            title: 'Anxiety Worksheet',
            subtitle:
                '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them."',
            author: 'Karina Saraswati',
            authorHonorific: 'Dr.',
            notes:
                'Please complete this assignment before our upcoming session.',
            type: AssignmentType.Socratic_Questions,
            preparations: [
              'Spend a moment thinking about each of the following questions.',
              'Record thorough responses carefully.',
              'Elaborate, and explain “why” or “why not” in your response',
            ],
            totalPages: 5,
            duration: 30,
            worksheets: [
              PatientWorksheet(
                page: 0,
                title: 'Thoughts to be questioned:',
                subtitle: 'You can write anythings that comes on your mind.',
                hint: 'Write your thoughts here...',
              ),
              PatientWorksheet(
                page: 1,
                title: 'What is the evidence for this thought?',
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 1,
                title: 'Am I basing this thought on facts, or on feelings?',
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 1,
                title: 'Is this reality more complicated than the thought?',
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 2,
                title: 'Could you be misinterpreting the evidence?',
                hint: 'Write your assumptions...',
              ),
              PatientWorksheet(
                page: 2,
                title: 'Might other people have different interpretations?',
                hint: 'Write your assumptions...',
              ),
              PatientWorksheet(
                page: 2,
                title: 'Am I looking at all the evidence?',
                subtitle:
                    "This section is to make sure that you are sure with the evidence, and not just what supports your thought.",
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 3,
                title: 'Could my thought be an exaggeration?',
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 3,
                title: 'Am I having this thought our of habit?',
                subtitle:
                    "You can tell what thoughts or which facts that support it.",
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 3,
                title: 'Did someone pass this thought? Are they reliable?',
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 4,
                title:
                    'Is my thought a likely scenario?  Or is it the worst-case scenario?',
                hint: 'Re-confirming your thoughts again...',
              ),
            ],
            createdAt: DateTime.now(),
          ),
          PatientAssignment(
            id: 2,
            title: 'Anxiety Worksheet',
            subtitle:
                '<span style="font-weight: 400;"><b style="font-weight: 900;">Facts</b> are verifiable statements.<br/><b>Opinions</b> are personal interpretations of facts, which differ from person to person.<br/><br/>For example, it is a fact that the sky is blue, and an opinion that the weather is beautiful.</span>',
            author: 'Karina Saraswati',
            authorHonorific: 'Dr.',
            notes:
                'Please complete this assignment before our upcoming session.',
            type: AssignmentType.Facts_or_Opinion,
            preparations: [
              'Spend a moment thinking about each of the following questions.',
              'Record thorough responses carefully.',
              'Elaborate, and explain “why” or “why not” in your response',
            ],
            totalPages: 5,
            duration: 30,
            worksheets: [
              PatientWorksheet(
                page: 0,
                title: 'I listened to my friend talk about their bad day.',
              ),
              PatientWorksheet(
                page: 1,
                title: 'I am a good friend.',
              ),
              PatientWorksheet(
                page: 2,
                title: 'I am ugly.',
              ),
              PatientWorksheet(
                page: 3,
                title: 'I have a blemish on my face.',
              ),
              PatientWorksheet(
                page: 4,
                title: 'My hair looks bad.',
              ),
              PatientWorksheet(
                page: 5,
                title: 'My boss said that I did a great job on the project.',
              ),
              PatientWorksheet(
                page: 6,
                title: 'No one will ever like me.',
              ),
              PatientWorksheet(
                page: 7,
                title: 'My crush said "no" when I asked them out.',
              ),
              PatientWorksheet(
                page: 8,
                title: "I'm not as smart as the rest of my class.",
                subtitle:
                    "You can tell what thoughts or which facts that support it.",
                hint: 'Tell what you have found...',
              ),
              PatientWorksheet(
                page: 9,
                title: "I'm lazy.",
              ),
              PatientWorksheet(
                page: 10,
                title: 'I watched TV instead of doing my homework.',
              ),
              PatientWorksheet(
                page: 11,
                title:
                    'My friend is angry at me. I know this because they were frowning.',
              ),
              PatientWorksheet(
                page: 12,
                title: 'My friend frowned.',
              ),
              PatientWorksheet(
                page: 13,
                title: 'Everyone was bored during my speech.',
              ),
              PatientWorksheet(
                page: 14,
                title: 'I should always be nice',
              ),
            ],
            createdAt: DateTime.now(),
          ),
        ],
      ),
    );
  }

  /// getter
  PatientAssignmentAnswer? getAnswerByAssignmentId(int assignmentId) {
    return state.assignmentAnswers.firstWhere(
      (element) => element.assignmentId == assignmentId,
    );
  }

  List<PatientAssignment> filterAssignmentByDate(DateTime date) {
    final startDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return state.assignments
        .where(
          (element) =>
              element.createdAt.isAfter(startDate) &&
              element.createdAt.isBefore(endDate),
        )
        .toList();
  }

  int countAssignmentsByDate(DateTime date) {
    return filterAssignmentByDate(date).length;
  }

  List<PatientAssignment> getAssignmentsByStatus(AssignmentStatus status) {
    return state.assignments
        .where((element) => element.status == status)
        .toList();
  }

  int countAssignmentsByStatus(AssignmentStatus status) {
    return getAssignmentsByStatus(status).length;
  }

  /// mutator
  void setNewAssignment(PatientAssignment newAssignment) {
    var newAssignments = state.assignments;
    newAssignments.add(newAssignment);

    emit(state.copyWith(assignments: newAssignments));
  }

  void setCompletedAssignments(int assignmentId) {
    var newAssignments = [...state.assignments];
    var index =
        newAssignments.indexWhere((element) => element.id == assignmentId);
    newAssignments[index] =
        newAssignments[index].copyWith(status: AssignmentStatus.finished);

    emit(state.copyWith(assignments: newAssignments));
  }

  void addAssignmentAnswer(PatientAssignmentAnswer assignmentAnswer) {
    final assignmentAnswers = [...state.assignmentAnswers, assignmentAnswer];

    emit(state.copyWith(assignmentAnswers: assignmentAnswers));
  }

  @override
  PatientAssignmentState fromJson(Map<String, dynamic> json) {
    return PatientAssignmentState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PatientAssignmentState state) {
    return <String, dynamic>{
      'assignments': state.assignments,
      'assignmentAnswers': state.assignmentAnswers,
    };
  }
}
