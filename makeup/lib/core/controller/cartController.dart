import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/core/controller/product_viewmodel.dart';
import 'package:makeup/main.dart';
import 'package:makeup/model/cart_item_model.dart';
import 'package:makeup/model/productModel.dart';
import 'package:makeup/model/usermodel.dart';
import 'package:uuid/uuid.dart';

import '../../screen/widget/colors.dart';
import '../../screen/widget/getBox.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<CartItemModel>? cartModel;

  updateCartData(Map<String, dynamic> data) async {
    //logger.i("UPDATED");
    firebaseFirestore.collection('Cart').doc(cartModel?.value.name).set(data);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        updateCartData({
          "name": product.name,
          "image": product.image,
          "quantity": 1,
          "price": product.price,
          'uid': box.read('uid'),
        });
      }
    } on FirebaseException catch (e) {
      Get.snackbar('error', '${e.message} sothing error');
      debugPrint(e.toString());
    }
  }

  List<CartItemModel> get productModel => _productModel;
  final List<CartItemModel> _productModel = [];

  bool _isItemAlreadyAdded(ProductModel product) => productModel
      .where((element) => element.name == cartModel?.value.name)
      .isNotEmpty;
}
