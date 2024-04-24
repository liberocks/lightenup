enum SizeOfThing {
  large,
  medium,
  small;

  String toJson() => name;
  static SizeOfThing fromJson(String json) => values.byName(json);
}
