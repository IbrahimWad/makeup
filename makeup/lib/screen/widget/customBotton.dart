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
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primary,
      ),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
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
