import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vip/helper/app_style.dart';
import 'package:vip/widget/custom_color_container.dart';
import 'package:vip/widget/logo.dart';

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(
          backgroundColor: AppStyle.yellow,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border(
              bottom: BorderSide(color: AppStyle.yellow,width: 30),
              left: BorderSide(color: AppStyle.yellow,width: 30),
              right: BorderSide(color: AppStyle.yellow,width: 30)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(width: Get.width * 0.4, height: Get.width * 0.13, color: AppStyle.yellow),
              // const SizedBox(height: 10),
              Container(),
              Text(
                'RENT A CAR',
                style: TextStyle(
                  color: AppStyle.yellow,
                  fontSize: 26
                ),
              ),
              // const SizedBox(height: 20),
              CustomColoredContainer(
                  width: 0.5,
                  height: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide < 600 ? 50 : 60,
                  color: AppStyle.yellow,
                  borderColor: AppStyle.yellow,
                  borderWidth: 0,
                  radius: 30,
                  onTap: (){},
                  outBorder: 6,
                  outColor: Colors.grey,
                  child: Center(
                    child: Text(
                        'SELECT CAR TYPE',
                      style: AppStyle.textButtonBlackStyle
                    ),
                  )
              ),
              // const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomColoredContainer(
                      width: 0.35,
                      height: 140,
                      color: AppStyle.darkGrey,
                      borderColor: AppStyle.yellow,
                      borderWidth: 3,
                      radius: 40,
                      onTap: (){},
                      outBorder: 0,
                      outColor: Colors.white,
                      child: buttonContent('VIP ICONS-01', 'SPORTS'),
                  ),
                  CustomColoredContainer(
                    width: 0.35,
                    height: 140,
                    color: AppStyle.darkGrey,
                    borderColor: AppStyle.yellow,
                    borderWidth: 3,
                    radius: 40,
                    onTap: (){},
                    outBorder: 0,
                    outColor: Colors.white,
                    child: buttonContent('VIP ICONS-02', 'LUXURY'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomColoredContainer(
                    width: 0.35,
                    height: 140,
                    color: AppStyle.darkGrey,
                    borderColor: AppStyle.yellow,
                    borderWidth: 3,
                    radius: 40,
                    onTap: (){},
                    outBorder: 0,
                    outColor: Colors.white,
                    child: buttonContent('VIP ICONS-03', 'SUV'),
                  ),
                  CustomColoredContainer(
                    width: 0.35,
                    height: 140,
                    color: AppStyle.darkGrey,
                    borderColor: AppStyle.yellow,
                    borderWidth: 3,
                    radius: 40,
                    onTap: (){},
                    outBorder: 0,
                    outColor: Colors.white,
                    child: buttonContent('VIP ICONS-04', 'ECONOMY'),
                  ),
                ],
              ),
              CustomColoredContainer(
                  width: 0.5,
                  height: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide < 600 ? 50 : 60,
                  color: AppStyle.red,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  radius: 40,
                  onTap: (){},
                  outBorder: 6,
                  outColor: Colors.grey,
                child: Center(
                  child: Text(
                      'SEPTEMBER OFFER',
                    style: AppStyle.textButtonWhiteStyle,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: AppStyle.yellow,
                        fontSize: 20,
                      fontFamily: 'Speed'
                    ),
                    children: [
                      const TextSpan(text: 'www'),
                      TextSpan(
                        text: '.VIPCAR.',
                        style: TextStyle(
                            color: AppStyle.yellow,
                            fontSize: 25
                        ),
                      ),
                      TextSpan(text: 'ae'),
                    ]
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }


  buttonContent(String icon, String title){
    return Column(
      children: [
        SvgPicture.asset(
            'assets/icons/$icon.svg',
          height: 100,
          width: 100,
          color: AppStyle.yellow,
        ),
        Text(
            title,
          style: TextStyle(
            fontSize: 28,
            color: AppStyle.yellow
          ),
        ),
      ],
    );
  }

}
