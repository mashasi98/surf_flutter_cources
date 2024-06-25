class UserEntity {
  final int id;
  final String name;
  final String secondName;
  final String email;
  final String birthDay;
  final String teamName;
  final String position;
  final List<String>? achievements;
  final String? photo;

  UserEntity({
    required this.id,
    required this.name,
    required this.secondName,
    required this.email,
    required this.birthDay,
    required this.teamName,
    required this.position,
    required this.achievements,
    required this.photo,
  });
}
