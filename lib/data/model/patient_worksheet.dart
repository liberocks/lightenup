import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_worksheet.freezed.dart';
part 'patient_worksheet.g.dart';

@freezed
class PatientWorksheet with _$PatientWorksheet {
  factory PatientWorksheet({
    @Default('') String name,
    @Default('') String title,
    @Default('') String subtitle,
    @Default('') String hint,
    @Default('') String answer,
  }) = _PatientWorksheet;

  factory PatientWorksheet.fromJson(Map<String, dynamic> json) =>
      _$PatientWorksheetFromJson(json);
}
