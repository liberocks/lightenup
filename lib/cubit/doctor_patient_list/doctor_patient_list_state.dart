import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/model.dart';

part 'doctor_patient_list_state.freezed.dart';

@freezed
class DoctorPatientListState with _$DoctorPatientListState {
  const factory DoctorPatientListState.initial({
    @Default([]) List<Patient> patients,
  }) = _Initial;

  factory DoctorPatientListState.fromJson(Map<String, dynamic> json) {
    return DoctorPatientListState.initial(
      patients: (json['patients'] as List)
          .map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
