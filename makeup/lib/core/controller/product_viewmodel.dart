import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:makeup/core/services/ProductService.dart';
import 'package:makeup/core/services/homeServices.dart';
import 'package:makeup/model/productModel.dart';

class ProductViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  ProductViewModel() {
    getProduct();
  }

  getProduct() async {
    _loading.value = true;
    await ProductService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
