import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:makeup/screen/widget/customText.dart';

class CustomSocialButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final String image;

  CustomSocialButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onPressed,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 29,
                  height: 30,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                CustomText(text: text),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
