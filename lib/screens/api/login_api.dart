import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moovbe_app/screens/models/login_model.dart';
import 'package:moovbe_app/utils/api_base_url.dart';
import 'package:moovbe_app/utils/internet_checking.dart';

class LoginApi {
  static Future<LoginModel> userLogin(
      {required String userName, required String password}) async {
    try {
      bool network = await InternetConnectivity.checking();
      if (network) {
        final responce = await http.post(
            Uri.parse(ApiBaseUrls.baseUrl + ApiBaseUrls.loginUrl),
            body: {"username": userName, "password": password});
        if (responce.statusCode == 200) {
          return LoginModel.fromJson(jsonDecode(responce.body));
        } else {
          return LoginModel.fromJson(jsonDecode(responce.body));
        }
      } else {
        return LoginModel(message: "Check Your Internet");
      }
    } catch (e) {
      return LoginModel(message: "Somthing went wrong");
    }
  }
}
