import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:makeup/screen/widget/customText.dart';
import 'package:makeup/screen/widget/getBox.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomText(text: 'bag'),
    ));
  }
}
