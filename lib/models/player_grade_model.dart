class PlayerGrade{
  final int? id;
  final int player_in_match_id;
  final int category_id;
  num grade_value;


  PlayerGrade({
    required this.id,
    required this.player_in_match_id,
    required this.category_id,
    required this.grade_value,
  });

  factory PlayerGrade.fromMap(Map<String, dynamic> map) {
    return PlayerGrade(
      id: map['id'],
      player_in_match_id: map['player_in_match_id'],
      category_id: map['category_id'],
      grade_value: map['grade_value'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'player_in_match_id': player_in_match_id,
      'category_id': category_id,
      'grade_value': grade_value,
    };
  }
}