class PlayerInMatch {
  final int? id;
  final int player_id;
  final int match_id;
  final String? minutes_played;
  final String? starting_position;
  final String? alternative_position;
  final String? role;

  PlayerInMatch({
    required this.id,
    required this.player_id,
    required this.match_id,
    required this.minutes_played,
    required this.starting_position,
    required this.alternative_position,
    required this.role
  });

  factory PlayerInMatch.fromMap(Map<String, dynamic> map) {
    return PlayerInMatch(
      id: map['id'],
      player_id: map['player_id'],
      match_id: map['match_id'],
      minutes_played: map['minutes_played'],
      starting_position: map['starting_position'],
      alternative_position: map['alternative_position'],
      role: map['role']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'player_id': player_id,
      'match_id': match_id,
      'minutes_played': minutes_played,
      'starting_position': starting_position,
      'alternative_position': alternative_position,
      'role': role
    };
  }
}