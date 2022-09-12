class Plant {
  String name = "";
  String description = "";
  int id = -1;
  Plant();

  Plant.fromDbMap(Map<String, dynamic> map) {
    name = map['title'];
    description = map['description'];
    id = map['id'];
  }

}
