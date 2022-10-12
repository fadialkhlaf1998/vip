import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomColoredContainer extends StatelessWidget {

  double width;
  double height;
  Color color;
  Color borderColor;
  double borderWidth;
  double radius;
  Widget child;
  VoidCallback onTap;
  double outBorder;
  Color outColor;


  CustomColoredContainer({
      required this.width,
      required this.height,
      required this.color,
      required this.borderColor,
      required this.borderWidth,
      required this.radius,
      required this.child,
      required this.onTap,
      required this.outBorder,
      required this.outColor
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: outColor,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(outBorder),
          width: Get.width * width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ),
      ),
    );
  }
}
