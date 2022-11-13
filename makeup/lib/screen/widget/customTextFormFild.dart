import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customText.dart';

class CustomTextFormFild extends StatelessWidget {
  final String text;
  final String hint;
  var onsave;
  var validator;
  final bool obscureText;

  CustomTextFormFild({
    Key? key,
    required this.text,
    required this.hint,
    required this.onsave,
    required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomText(
            alignment: Alignment.topLeft,
            text: text,
            fontsize: 14,
          ),
          TextFormField(
            obscureText: obscureText,
            validator: validator,
            onSaved: onsave,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: primary),
              ),
              focusColor: primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
