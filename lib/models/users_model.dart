class AppUser {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String passwordHash;
  final int roleId;

  AppUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.passwordHash,
    required this.roleId,
  });

  // Factory constructor for creating a user from a Supabase response
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map["id"] as String,
      email: map['email'] as String,
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      passwordHash: map['password_hash'] as String,
      roleId: map['role_id'] as int,
    );
  }

  // Convert user instance to a map for inserting/updating in Supabase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'password_hash': passwordHash,
      'role_id': roleId,
    };
  }
}