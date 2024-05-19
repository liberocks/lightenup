import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/model.dart';

part 'patient_assignment_state.freezed.dart';

@freezed
class PatientAssignmentState with _$PatientAssignmentState {
  const factory PatientAssignmentState.initial({
    @Default([]) List<PatientAssignment> assignments,
    @Default([]) List<PatientAssignmentAnswer> assignmentAnswers,
  }) = _Initial;

  factory PatientAssignmentState.fromJson(Map<String, dynamic> json) {
    return PatientAssignmentState.initial(
      assignments: (json['assignments'] as List)
          .map((e) => PatientAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignmentAnswers: (json['assignmentAnswers'] as List)
          .map(
            (e) => PatientAssignmentAnswer.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
