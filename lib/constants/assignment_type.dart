// ignore_for_file: constant_identifier_names

enum AssignmentType {
  Facts_or_Opinion,
  Socratic_Questions;

  String toJson() => name;
  static AssignmentType fromJson(String json) => values.byName(json);
}
