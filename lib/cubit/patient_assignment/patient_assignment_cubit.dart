import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lightenup/constants/constants.dart';

import 'package:lightenup/cubit/patient_assignment/patient_assignment_state.dart';
import 'package:lightenup/data/model/model.dart';

class PatientAssignmentCubit extends HydratedCubit<PatientAssignmentState> {
  PatientAssignmentCubit() : super(const PatientAssignmentState.initial());

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
