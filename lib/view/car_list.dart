
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vip/controller/car_list_controller.dart';
import 'package:vip/controller/intro_controller.dart';
import 'package:vip/helper/app_style.dart';
import 'package:vip/widget/custom_color_container.dart';

class CarList extends StatelessWidget {

  IntroController introController = Get.find();
  CarListController carListController = Get.put(CarListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.yellow,
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
                                        _topBanner(
                                            introController.categoryList[categoryListIndex].cars[index].title,
                                            introController.categoryList[categoryListIndex].cars[index].seets.toString(),
                                            introController.categoryList[categoryListIndex].cars[index].doors.toString()
                                        ),
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
                carListController.moveToCategory(2);
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

  _topBanner(String carName, String seat, String doors){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      color: Colors.red,
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(carName, seat, doors),
          _price(),
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
          color: Colors.blue,
          child:   Text(
            carName + carName + carName + carName ,
            maxLines: 3,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 35
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

  _price(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width * 0.25,
          height: Get.width * 0.25,
          decoration: BoxDecoration(
            color: AppStyle.yellow,
            shape: BoxShape.circle
          ),
        ),
        Container(
          width: Get.width * 0.23,
          height: Get.width * 0.23,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            border: Border.all(width: 10,color: Colors.black)
          ),
        ),
        Container(
          height: Get.width * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 1),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: AppStyle.yellow,
                      fontSize: 18,
                      fontFamily: 'Speed'
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}
