import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {

  double width;
  double height;
  Color color;


  Logo({
    required this.width,
    required this.height,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: SvgPicture.asset(
            'assets/icons/logo.svg',
          fit: BoxFit.contain,
          color: color,
        ),
      ),
    );
  }
}
