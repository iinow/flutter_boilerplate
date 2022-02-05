class Room {
  String name;

  Room({required this.name});

  Map toJson() => {'name': name};
}
