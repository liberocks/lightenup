import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/model.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  factory Patient({
    required int id,
    required String name,
    required String diagnosis,
    required String profilePicture,
    @Default([]) List<PatientAssignment> assignments,
    @Default([]) List<PatientAssignment> assignmentAnswers,
    @Default([]) List<PatientMood> moods,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
