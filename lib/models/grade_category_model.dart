class GradeCategory {
  final int? id;
  final String category_name;
  final String created_by;


  GradeCategory({
    required this.id,
    required this.category_name,
    required this.created_by,
  });

  factory GradeCategory.fromMap(Map<String, dynamic> map) {
    return GradeCategory(
      id: map['id'],
      category_name: map['category_name'],
      created_by: map['created_by'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category_name': category_name,
      'created_by': created_by,
    };
  }
}