import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vip/controller/intro_controller.dart';

class Intro extends StatelessWidget {

  IntroController introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.amber,
        ),
      ),
    );
  }
}
