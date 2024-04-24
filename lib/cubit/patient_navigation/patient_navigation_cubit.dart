import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/patient_navigation/patient_navigation_state.dart';

class PatientNavigationCubit extends Cubit<PatientNavigationState> {
  PatientNavigationCubit() : super(const PatientNavigationState.home());

  void switchToHome() {
    emit(const PatientNavigationState.home());
  }

  void switchToSchedule() {
    emit(const PatientNavigationState.schedule());
  }

  void switchToProfile() {
    emit(const PatientNavigationState.profile());
  }
}
