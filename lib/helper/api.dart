import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:vip/model/all_data.dart';

class Api {

  static var url = 'https://phpstack-548447-2953380.cloudwaysapps.com/api/';

  static Future login(String username, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse('${url}hotel/login'));
    request.body = json.encode({
      "username": username,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      return MyData.fromJson(jsonDecode(jsonData));
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }


}