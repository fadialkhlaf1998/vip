import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vip/controller/car_list_controller.dart';
import 'package:vip/controller/intro_controller.dart';
import 'package:vip/helper/app_style.dart';
import 'package:vip/view/car_list.dart';
import 'package:vip/widget/custom_color_container.dart';
import 'package:vip/widget/logo.dart';

class HomePage extends StatelessWidget {

  IntroController introController = Get.find();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Column(
                children: [
                  Hero(
                    tag: 'logo',
                      child: Logo(width: Get.width * 0.4, height: Get.width * 0.13, color: AppStyle.yellow),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'RENT A CAR',
                    style: TextStyle(
                        color: AppStyle.yellow,
                        fontSize: 26
                    ),
                  ),
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
                ],
              ),
              Wrap(
                spacing: 50,
                direction: Axis.horizontal,
                children: introController.categoryList.map((e) => Hero(
                  flightShuttleBuilder: AppStyle.flightShuttleBuilder,
                  tag: e.id,
                  child: CustomColoredContainer(
                    width: 0.35,
                    height: 130,
                    color: AppStyle.darkGrey,
                    borderColor: AppStyle.yellow,
                    borderWidth: 3,
                    radius: 40,
                    onTap: (){
                      Get.toNamed('/carList', arguments: [introController.categoryList.indexOf(e)]);
                    },
                    outBorder: 0,
                    outColor: Colors.white,
                    child: SingleChildScrollView(
                      child: Container(
                        height: 130,
                        child: buttonContent(e.image, e.title),
                      ),
                    ),
                  ),
                )).toList(),
              ),
              Column(
                children: [
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
                              fontSize: 18,
                              fontFamily: 'Speed'
                          ),
                          children: [
                            const TextSpan(text: 'www'),
                            TextSpan(
                              text: '.VIPCAR.',
                              style: TextStyle(
                                  color: AppStyle.yellow,
                                  fontSize: 26
                              ),
                            ),
                            const TextSpan(text: 'ae'),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 270,
                child: SvgPicture.asset(
                    'assets/icons/DUBAI.svg',
                  fit: BoxFit.cover,
                  color: AppStyle.yellow,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.network(
            icon,
          height: 40,
          width: 80,
          color: AppStyle.yellow,
        ),
        const SizedBox(height: 10),
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
