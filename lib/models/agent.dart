class Agent {
  final int? id;
  final String name;
  Agent({this.id, required this.name});

  // add tojason and from json methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
  factory Agent.fromJson(Map<String, dynamic> map) {
    return Agent(
      id: map['id'],
      name: map['name'],
    );
  }
}

