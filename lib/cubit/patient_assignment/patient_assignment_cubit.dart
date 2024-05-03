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
            title: 'Socratic Questions',
            subtitle:
                '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them."',
            author: 'Karina Saraswati',
            type: 'Anxiety worksheet',
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
            id: 1,
            title: 'Facts or Opinion',
            subtitle:
                '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them."',
            author: 'Karina Saraswati',
            type: 'Anxiety worksheet',
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
    var newAssignments = state.assignments;
    var index =
        newAssignments.indexWhere((element) => element.id == assignmentId);
    newAssignments[index] =
        newAssignments[index].copyWith(status: AssignmentStatus.finished);

    emit(state.copyWith(assignments: newAssignments));
  }

  void addAssignmentAnswer(PatientAssignmentAnswer assignmentAnswer) {
    var assignmentAnswers = state.assignmentAnswers;
    assignmentAnswers.add(assignmentAnswer);

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
