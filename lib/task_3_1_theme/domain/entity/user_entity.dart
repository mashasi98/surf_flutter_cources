class UserEntity {
  final int id;
  String name;
  String secondName;
  String email;
  String birthDay;
  String teamName;
  String position;
  List<String> achievements;
  String? photo;

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
