import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/data/model/patient_worksheet.dart';

part 'patient_assignment.freezed.dart';
part 'patient_assignment.g.dart';

@freezed
class PatientAssignment with _$PatientAssignment {
  factory PatientAssignment({
    required int id,
    required String title,
    required String subtitle,
    required String author,
    required List<String> preparations,
    required int duration, // in minutes
    required List<PatientWorksheet> worksheets,
    required DateTime createdAt,
    @Default(AssignmentStatus.unfinished) AssignmentStatus status,
    DateTime? finishedAt,
    String? authorProfilePic,
    String? notes,
  }) = _PatientAssignment;

  factory PatientAssignment.fromJson(Map<String, dynamic> json) =>
      _$PatientAssignmentFromJson(json);
}
