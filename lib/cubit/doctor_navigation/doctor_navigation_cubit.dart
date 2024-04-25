import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/cubit/doctor_navigation/doctor_navigation_state.dart';

class DoctorNavigationCubit extends Cubit<DoctorNavigationState> {
  DoctorNavigationCubit() : super(const DoctorNavigationState.home());

  void switchToHome() {
    emit(const DoctorNavigationState.home());
  }
}
