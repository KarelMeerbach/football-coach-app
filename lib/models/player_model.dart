class Player {
  final int team_id;
  final DateTime createdAt;
  final String first_name;
  final String last_name;
  final String gender;
  final String competition_type;
  final DateTime birthdate;
  final String country;
  final String position;
  final String? secondary_position;


  Player({
    required this.team_id,
    required this.createdAt,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.competition_type,
    required this.birthdate,
    required this.country,
    required this.position,
    required this.secondary_position,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      team_id: map['team_id'],
      createdAt: DateTime.parse(map['created_at']),
      first_name: map['first_name'],
      last_name: map['last_name'],
      gender: map['gender'],
      competition_type: map['competition_type'],
      birthdate: DateTime.parse(map['birthdate']),
      country: map['country'],
      position: map['position'],
      secondary_position: map['secondary_position']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team_id': team_id,
      'created_at': createdAt.toIso8601String(),
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'competition_type': competition_type,
      'birthdate': birthdate.toIso8601String(),
      'country': country,
      'position': position,
      'secondary_position': secondary_position,
    };
  }
}