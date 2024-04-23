import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:lightenup/cubit/patient_mood_tracker/patient_mood_tracker_state.dart';
import 'package:lightenup/data/model/model.dart';

class PatientMoodTrackerCubit extends HydratedCubit<PatientMoodTrackerState> {
  PatientMoodTrackerCubit() : super(const PatientMoodTrackerState.initial());

  void addMood(PatientMood mood) {
    final moods = state.moods;
    moods.add(mood);

    emit(state.copyWith(moods: moods));
  }

  void removeMood(int index) {
    final moods = state.moods;
    moods.where((element) => element.id != index);

    emit(state.copyWith(moods: moods));
  }

  @override
  PatientMoodTrackerState fromJson(Map<String, dynamic> json) {
    return PatientMoodTrackerState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PatientMoodTrackerState state) {
    return <String, dynamic>{
      'moods': state.moods,
    };
  }
}
