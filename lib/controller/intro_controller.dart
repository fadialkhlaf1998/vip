import 'package:get/get.dart';
import 'package:vip/helper/api.dart';
import 'package:vip/helper/global.dart';
import 'package:vip/model/all_data.dart';

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
        Future.delayed(const Duration(milliseconds: 1000)).then((_){
          Get.offNamed('/home');
        });
      }else{
        print('error in get data-------');
      }
    });
  }

}