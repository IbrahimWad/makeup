import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/cartViewModel.dart';
import 'package:makeup/model/cartProductModel.dart';
import 'package:makeup/model/productModel.dart';
import 'package:makeup/screen/widget/customBotton.dart';
import 'package:makeup/screen/widget/customText.dart';
import 'package:makeup/screen/widget/getBox.dart';

class Details extends StatelessWidget {
  Details({required this.productModel});
  late ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.network('${productModel.image}'),
            CustomText(text: "${productModel.name}"),
            //CustomText(text: '${productModel.description}'),
            CustomText(text: '${productModel.price} DIQ'),
            GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => CustomButton(
                    onPressed: () {
                      controller.addProduct(CartProductModel(
                        name: productModel.name,
                        price: productModel.price,
                        image: productModel.image,
                        quantity: 1,
                      ));
                    },
                    text: 'add to cart'))
          ],
        ),
      ),
    );
  }
}
