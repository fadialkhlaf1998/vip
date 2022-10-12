

import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static String companyName = '';
  static String companyImage = '';
  static String companyPassword = '';
  static String companyUsername = '';
  static String companyId = '';


  static saveCompanyInfo(String name,String image,String password,String username,String id) async {
    companyName = name;
    companyImage = image;
    companyPassword = password;
    companyUsername = username;
    companyId = id;
    await SharedPreferences.getInstance().then((prefs){
      prefs.setString("name", companyName);
      prefs.setString("image", companyImage);
      prefs.setString("password", companyPassword);
      prefs.setString("email", companyUsername);
      prefs.setString("id", companyId);
    });

  }

}