class Match {
  final int? id;
  final int competition_id;
  final DateTime match_date;
  final DateTime created_at;
  final String title;
  final String created_by;
  final bool finsihed;

  Match({
    required this.id,
    required this.competition_id,
    required this.match_date,
    required this.created_at,
    required this.title,
    required this.created_by,
    required this.finsihed
  });

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'],
      competition_id: map['competition_id'],
      match_date: DateTime.parse(map['match_date']),
      created_at: DateTime.parse(map['created_at']),
      title: map['title'],
      created_by: map['created_by'],
      finsihed: map['finish']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'competition_id': competition_id,
      'match_date': match_date.toIso8601String(),
      'created_by': created_by,
      'created_at': created_at.toIso8601String(),
      'title': title,
      'finish': finsihed
    };
  }
}