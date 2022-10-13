import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vip/helper/app_style.dart';
import 'package:vip/view/car_list.dart';
import 'package:vip/view/home_page.dart';
import 'package:vip/view/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/carList',
          page: ()=> CarList(),
          transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 1200), curve: Curves.fastOutSlowIn,
          arguments: ['index']
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: generateMaterialColor(AppStyle.yellow),
        primarySwatch: generateMaterialColor(AppStyle.yellow),
        fontFamily: 'Speed'
      ),
      home: Intro()
    );
  }
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));


