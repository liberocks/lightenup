import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lightenup/cubit/doctor_patient_list/default.dart';

import 'package:lightenup/cubit/doctor_patient_list/doctor_patient_list_state.dart';

class DoctorPatientListCubit extends HydratedCubit<DoctorPatientListState> {
  DoctorPatientListCubit() : super(const DoctorPatientListState.initial());

  void resetPatientList() {
    emit(state.copyWith(patients: defaultPatients));
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
