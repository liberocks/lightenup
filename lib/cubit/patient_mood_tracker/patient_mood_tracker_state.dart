import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/model.dart';

part 'patient_mood_tracker_state.freezed.dart';

@freezed
class PatientMoodTrackerState with _$PatientMoodTrackerState {
  const factory PatientMoodTrackerState.initial({
    @Default([]) List<PatientMood> moods,
  }) = _Initial;

  factory PatientMoodTrackerState.fromJson(Map<String, dynamic> json) {
    return PatientMoodTrackerState.initial(
      moods: (json['moods'] as List)
          .map((e) => PatientMood.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
