import 'package:makeup/screen/widget/colors.dart';

class UserModel {
  String? userId, email, name;

  UserModel({
    this.email,
    this.name,
    this.userId,
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
