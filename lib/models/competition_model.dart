class Competition {
  final int? id;
  final String name;
  final String competition_type;
  final String createdBy;
  final DateTime createdAt;

  Competition({
    required this.id,
    required this.name,
    required this.competition_type,
    required this.createdBy,
    required this.createdAt,
  });

  factory Competition.fromMap(Map<String, dynamic> map) {
    return Competition(
      id: map['id'],
      name: map['name'],
      competition_type: map['competition_type'],
      createdBy: map['created_by'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'competition_type': competition_type,
      'created_by': createdBy,
      'created_at': createdAt.toIso8601String(),
    };
  }
}