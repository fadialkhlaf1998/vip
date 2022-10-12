import 'package:get/get.dart';
import 'package:vip/helper/api.dart';
import 'package:vip/helper/global.dart';
import 'package:vip/model/all_data.dart';
import 'package:vip/view/home_page.dart';

class IntroController extends GetxController{

  RxList<Category> categoryList = <Category>[].obs;


  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    Api.login('test', 'test').then((value) async {
      if(value != null){
        await Global.saveCompanyInfo(value.title, value.image, value.password, value.username, value.id.toString());
        categoryList.addAll(value.category);
        Get.offAll(()=>HomePage());
      }else{
        print('error in get data-------');
      }
    });
  }

}