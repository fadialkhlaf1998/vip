import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vip/controller/car_list_controller.dart';
import 'package:vip/controller/intro_controller.dart';
import 'package:vip/helper/app_style.dart';
import 'package:vip/widget/custom_color_container.dart';
import 'package:vip/widget/logo.dart';

class CarList extends StatefulWidget {


  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  IntroController introController = Get.find();
  CarListController carListController = Get.put(CarListController());


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).then((value){
      carListController.moveToCategory(Get.arguments[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.yellow,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppStyle.darkGrey,
          elevation: 0,
        ),
        
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              SizedBox(
                height: Get.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top),
                child: ScrollablePositionedList.builder(
                  itemScrollController: carListController.itemScrollController,
                    itemCount: introController.categoryList.length,
                    itemBuilder: (BuildContext context, categoryListIndex){
                      return SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          color: AppStyle.darkGrey,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: introController.categoryList[categoryListIndex].cars.length,
                            itemBuilder: (BuildContext context, index){
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 30,color: AppStyle.yellow)
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                     Image.network(
                                        introController.categoryList[categoryListIndex].cars[index].image,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 6,
                                              color: AppStyle.yellow,
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                      Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _topBanner(introController.categoryList[categoryListIndex].cars[index]),
                                        _bottomBanner()
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _header(){
    return Container(
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
        color: AppStyle.darkGrey,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40)
        )
      ),
      child: Center(
        child: Wrap(
          spacing: 30,
          direction: Axis.horizontal,
          children: introController.categoryList.map((e) => Hero(
            flightShuttleBuilder: AppStyle.flightShuttleBuilder,
            tag: e.id,
            child: CustomColoredContainer(
              width: 0.2,
              height: 50,
              color: AppStyle.darkGrey,
              borderColor: AppStyle.yellow,
              borderWidth: 3,
              radius: 40,
              onTap: (){
                carListController.moveToCategory(introController.categoryList.indexOf(e));
              },
              outBorder: 0,
              outColor: Colors.white,
              child: Center(
                child: Text(
                  e.title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
      )
    );
  }

  _topBanner(car){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(car.title, car.seets.toString(), car.doors.toString()),
          _price(car.oldPrice.toString(), car.price.toString()),
        ],
      ),
    );
  }

  _title(String carName, String seat, String doors){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          width: Get.width * 0.6,
          child:   Text(
            carName,
            maxLines: 3,
            style:  TextStyle(
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
                color: Colors.white,
                fontSize: 35,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Seat.svg',
              width: 35,
              height: 35,
              color: AppStyle.yellow,
            ),
            const SizedBox(width: 10),
            Text(
              seat,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
            ),
            const SizedBox(width: 25),
            SvgPicture.asset(
              'assets/icons/Door.svg',
              width: 35,
              height: 35,
              color: AppStyle.yellow,
            ),
            const SizedBox(width: 10),
            Text(
              seat,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
          ],
        )

      ],
    );
  }

  _price(String oldPrice, String price){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width * 0.28,
          height: Get.width * 0.28,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppStyle.yellow,
            shape: BoxShape.circle
          ),
        ),
        Container(
          width: Get.width * 0.26,
          height: Get.width * 0.26,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            border: Border.all(width: 10,color: Colors.black)
          ),
        ),
        Container(
          height: Get.width * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _oldPrice(oldPrice),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold
                ),
              ),
               Column(
                 children: const [
                   Text(
                     'AED',
                     style: TextStyle(
                         color: Colors.grey,
                         fontSize: 18,
                         fontFamily: 'Roboto',
                         fontWeight: FontWeight.bold
                     ),
                   ),
                   Text(
                     'PER DAY',
                     style: TextStyle(
                         color: Colors.grey,
                         fontSize: 15,
                         fontFamily: 'Roboto',
                         fontWeight: FontWeight.bold
                     ),
                   )
                 ],
               )
            ],
          ),
        )
      ],
    );
  }

  _oldPrice(String oldPrice){
    return  Row(
      children: [
        const Text(
          'Before',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                oldPrice,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
              RotationTransition(
                  turns: const AlwaysStoppedAnimation(-9 / 360),
                  child: Container(
                    height: 3,
                    // width: 70,
                    color: Colors.red,
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

  _bottomBanner(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Logo(width: Get.width * 0.2, height: 100, color: AppStyle.yellow),
        CustomColoredContainer(
            width: 0.17,
            height: 50,
            color: Colors.red,
            borderColor: Colors.white,
            borderWidth: 0,
            radius: 30,
            onTap: (){
              Get.back();
            },
            outBorder: 0,
            outColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 6),
              Text(
                'HOME',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
        CustomColoredContainer(
            width: 0.23,
            height: 50,
            color: AppStyle.yellow,
            borderColor: Colors.white,
            borderWidth: 0,
            radius: 30,
            onTap: (){},
            outBorder: 0,
            outColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.whatsapp,
                color: Colors.green,
                size: 40,
              ),
              SizedBox(width: 6),
              Text(
                'book now',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
