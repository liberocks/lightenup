import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_navigation_state.freezed.dart';

@freezed
class PatientNavigationState with _$PatientNavigationState {
  const factory PatientNavigationState.home() = _PatientNavigationHome;
  const factory PatientNavigationState.schedule() = _PatientNavigationSchedule;
  const factory PatientNavigationState.profile() = _PatientNavigationProfile;
}
