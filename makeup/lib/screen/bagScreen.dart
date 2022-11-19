import 'package:flutter/material.dart';
import 'package:makeup/screen/widget/customText.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: CustomText(text: 'Bag'),
      )),
    );
  }
}
