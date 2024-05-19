enum AssignmentStatus {
  unfinished,
  finished;

  String toJson() => name;
  static AssignmentStatus fromJson(String json) => values.byName(json);
}
