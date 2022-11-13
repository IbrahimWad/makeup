import 'package:flutter/material.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customText.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.051,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: primary,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: Colors.white,
          fontsize: 18,
        ),
      ),
    );
  }
}
