

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vip/view/car_list.dart';

class CarListController extends GetxController{


  final ItemScrollController itemScrollController = ItemScrollController();

  moveToCategory(index){
   itemScrollController.scrollTo(
       index: index,
       duration: const Duration(milliseconds: 2000),
       curve: Curves.fastOutSlowIn
   );

 }


}