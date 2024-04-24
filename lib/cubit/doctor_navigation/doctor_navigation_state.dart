import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_navigation_state.freezed.dart';

@freezed
class DoctorNavigationState with _$DoctorNavigationState {
  const factory DoctorNavigationState.home() = _DoctorNavigationHome;
}
