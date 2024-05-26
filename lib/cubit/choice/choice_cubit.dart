import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lightenup/constants/constants.dart';

import 'package:lightenup/cubit/choice/choice_state.dart';

class ChoiceCubit extends HydratedCubit<ChoiceState> {
  ChoiceCubit() : super(const ChoiceState.initial());

  void setMode(ModeChoice mode) {
    emit(state.copyWith(mode: mode));
  }

  @override
  ChoiceState fromJson(Map<String, dynamic> json) {
    return ChoiceState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ChoiceState state) {
    return <String, dynamic>{
      'mode': state.mode?.toJson(),
    };
  }
}
