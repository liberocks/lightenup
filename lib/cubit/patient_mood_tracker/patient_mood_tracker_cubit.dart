import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:lightenup/cubit/patient_mood_tracker/patient_mood_tracker_state.dart';
import 'package:lightenup/data/model/model.dart';

class PatientMoodTrackerCubit extends HydratedCubit<PatientMoodTrackerState> {
  PatientMoodTrackerCubit() : super(const PatientMoodTrackerState.initial());

  /// getter
  int get latestId {
    return state.moods.isEmpty ? 0 : state.moods.last.id;
  }

  /// mutator
  void addMood(PatientMood mood) {
    List<PatientMood> moods = state.moods.toList();
    moods.add(mood);

    emit(state.copyWith(moods: moods));
  }

  void removeMood(int index) {
    List<PatientMood> moods = state.moods.toList();

    moods = moods.where((element) => element.id != index).toList();

    emit(state.copyWith(moods: moods));
  }

  PatientMood? getMoodByDate(DateTime date) {
    try {
      return state.moods.firstWhere(
        (element) =>
            element.date.year == date.year &&
            element.date.month == date.month &&
            element.date.day == date.day,
      );
    } catch (e) {
      return null;
    }
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
