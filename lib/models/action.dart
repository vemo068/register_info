class Actione {
  final int? id;
  final String name;
  Actione({this.id, required this.name});
  // add tojason and from json methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Actione.fromJson(Map<String, dynamic> map) {
    return Actione(
      id: map['id'],
      name: map['name'],
    );
  }
}
