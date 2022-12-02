import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:makeup/core/services/database/cartDatabase_helper.dart';
import 'package:makeup/model/cartProductModel.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get looading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);

    update();
  }
}
