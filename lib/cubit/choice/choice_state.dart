import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/constants/constants.dart';

part 'choice_state.freezed.dart';

@freezed
class ChoiceState with _$ChoiceState {
  const factory ChoiceState.initial({
    ModeChoice? mode,
  }) = _Initial;

  factory ChoiceState.fromJson(Map<String, dynamic> json) {
    return ChoiceState.initial(
      mode: json['mode'] != null
          ? ModeChoice.fromJson(json['mode'] as String)
          : null,
    );
  }
}
