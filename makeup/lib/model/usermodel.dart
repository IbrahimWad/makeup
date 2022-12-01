import 'package:makeup/model/cart_item_model.dart';
import 'package:makeup/screen/widget/colors.dart';

import '../core/controller/cartController.dart';

class UserModel {
  String? userId, email, name;
  var cart;

  UserModel({this.email, this.name, this.userId, this.cart});

  UserModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    cart = map['cart'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'cart': cart,
    };
  }
}
