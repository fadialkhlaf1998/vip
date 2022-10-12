

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyle{


  static Color yellow = const Color(0xFFfff200);
  static Color red = const Color(0xFFff0000);
  static Color darkGrey = const Color(0xFF272424);


  static final textButtonBlackStyle = TextStyle(
    color: Colors.black,
    fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide < 600 ? 14 : 30,
  );

  static final textButtonWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide < 600 ? 14 : 30,
  );






}