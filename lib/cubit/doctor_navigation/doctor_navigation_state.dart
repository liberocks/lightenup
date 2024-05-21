import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_navigation_state.freezed.dart';

@freezed
class DoctorNavigationState with _$DoctorNavigationState {
  const factory DoctorNavigationState.home() = _DoctorNavigationHome;
  const factory DoctorNavigationState.assignments() =
      _DoctorNavigationAssignments;
  const factory DoctorNavigationState.schedule() = _DoctorNavigationSchedule;
  const factory DoctorNavigationState.profile() = _DoctorNavigationProfile;
}
