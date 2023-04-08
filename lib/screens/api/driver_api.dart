import 'dart:convert';
import 'dart:developer';

import 'package:moovbe_app/screens/models/driver_model.dart';
import 'package:moovbe_app/utils/api_base_url.dart';
import 'package:http/http.dart' as http;
import 'package:moovbe_app/utils/secure_store.dart';

class DriverListApi {
  static Future<DriverModel> getDriverDeatils() async {
    try {
      final userApiKey = await SecureStore.getApiKey();
      final userToken = await SecureStore.getToken();
      final response = await http.get(
          Uri.parse(
              "${"${ApiBaseUrls.baseUrl}${ApiBaseUrls.driverApi}$userApiKey"}/"),
          headers: {'Authorization': "Bearer $userToken"});
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return DriverModel.fromJson(jsonDecode(response.body));
      } else {
        throw 'something went wrong !';
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }
}
