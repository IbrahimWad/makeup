class UserModel {
  late String userId, email, name;

  UserModel({
    required this.email,
    required this.name,
    required this.userId,
  });

  UserModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    userId = map['userId'];
    email = map['email'];
    name = map['name'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }
}
