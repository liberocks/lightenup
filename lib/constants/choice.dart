enum ModeChoice {
  patient,
  doctor;

  String toJson() => name;
  static ModeChoice fromJson(String json) => values.byName(json);
}
