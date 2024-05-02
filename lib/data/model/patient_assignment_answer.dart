import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/patient_worksheet.dart';

part 'patient_assignment_answer.freezed.dart';
part 'patient_assignment_answer.g.dart';

@freezed
class PatientAssignmentAnswer with _$PatientAssignmentAnswer {
  factory PatientAssignmentAnswer({
    required int assignmentId,
    required List<PatientWorksheet> worksheets,
    DateTime? date,
  }) = _PatientAssignmentAnswer;

  factory PatientAssignmentAnswer.fromJson(Map<String, dynamic> json) =>
      _$PatientAssignmentAnswerFromJson(json);
}
