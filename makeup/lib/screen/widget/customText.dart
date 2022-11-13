import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:makeup/screen/widget/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final Alignment alignment;
  final double height;
  CustomText({
    Key? key,
    required this.text,
    this.color = primary,
    this.fontsize = 18,
    this.alignment = Alignment.center,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
          height: height,
        ),
      ),
    );
  }
}
