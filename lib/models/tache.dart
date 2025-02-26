class Tache {
  int? id;
  int action_id;
  int agent_id;
  DateTime date;
  Tache({this.id, required this.action_id, required this.agent_id, required this.date});

  // add tojason and from json methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'action_id': action_id,
      'agent_id': agent_id,
      'date': date.toIso8601String(),
    };
  }

  factory Tache.fromJson(Map<String, dynamic> map) {
    return Tache(
      id: map['id'],
      action_id: map['action_id'],
      agent_id: map['agent_id'],
      date: DateTime.parse(map['date']),
    );
  }
}


//create a widjet to display the taches in table
