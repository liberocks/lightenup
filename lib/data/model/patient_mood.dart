import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_mood.freezed.dart';
part 'patient_mood.g.dart';

@freezed
class PatientMood with _$PatientMood {
  factory PatientMood({
    required int id,
    required String mood,
    required String emoji,
    required String colorHex,
    required String backgroundHex,
    required String moodText,
    required List<String> reasons,
    required String notes,
    required DateTime date,
  }) = _PatientMood;

  factory PatientMood.fromJson(Map<String, dynamic> json) =>
      _$PatientMoodFromJson(json);
}
