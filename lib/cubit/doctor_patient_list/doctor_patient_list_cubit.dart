import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lightenup/cubit/doctor_patient_list/default.dart';

import 'package:lightenup/cubit/doctor_patient_list/doctor_patient_list_state.dart';
import 'package:lightenup/data/model/model.dart';

class DoctorPatientListCubit extends HydratedCubit<DoctorPatientListState> {
  DoctorPatientListCubit() : super(const DoctorPatientListState.initial());

  void resetPatientList() {
    emit(state.copyWith(patients: defaultPatients));
  }

  void setPatientDiagnosis(int patientId, String diagnosis) {
    final patients = state.patients.map((patient) {
      if (patient.id == patientId) {
        return patient.copyWith(diagnosis: diagnosis);
      }
      return patient;
    }).toList();

    emit(state.copyWith(patients: patients));
  }

  void addNewAssignment(int patientId, PatientAssignment assignment) {
    final patients = state.patients.map((patient) {
      if (patient.id == patientId) {
        final assignments = [assignment, ...patient.assignments];
        return patient.copyWith(assignments: assignments);
      }
      return patient;
    }).toList();

    emit(state.copyWith(patients: patients));
  }

  @override
  DoctorPatientListState fromJson(Map<String, dynamic> json) {
    return DoctorPatientListState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DoctorPatientListState state) {
    return <String, dynamic>{
      'patients': state.patients,
    };
  }
}
