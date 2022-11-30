import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/model/cart_item_model.dart';
import 'package:makeup/model/productModel.dart';
import 'package:makeup/model/usermodel.dart';
import 'package:uuid/uuid.dart';

import '../../screen/widget/colors.dart';
import '../../screen/widget/getBox.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
}
