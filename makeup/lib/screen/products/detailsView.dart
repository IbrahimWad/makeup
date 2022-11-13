import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:makeup/model/productModel.dart';
import 'package:makeup/screen/widget/customText.dart';

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
            CustomText(text: '${productModel.price} DIQ')
          ],
        ),
      ),
    );
  }
}
