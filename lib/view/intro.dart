import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vip/controller/intro_controller.dart';
import 'package:vip/helper/app_style.dart';

class Intro extends StatelessWidget {

  IntroController introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: AppStyle.darkGrey,
          child: Center(
            child: Hero(
              tag: 'logo',
              child: SizedBox(
                width: Get.width * 0.7,
                child: Lottie.asset('assets/animation/Vip Logo Animation.json'),
              ),
            )
          ),
        ),
      ),
    );
  }
}
