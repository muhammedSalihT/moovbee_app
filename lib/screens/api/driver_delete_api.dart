import 'dart:convert';
import 'dart:developer';

import 'package:moovbe_app/screens/models/driver_post_model.dart';
import 'package:moovbe_app/utils/api_base_url.dart';
import 'package:moovbe_app/utils/secure_store.dart';
import 'package:http/http.dart' as http;

class DriverDeleteApi {
  static Future<DriverPostModel> deleteDriver(
      {required String driverId}) async {
    try {
      final userApiKey = await SecureStore.getApiKey();
      final userToken = await SecureStore.getToken();
      final response = await http.delete(
          Uri.parse(
              "${"${ApiBaseUrls.baseUrl}${ApiBaseUrls.driverApi}$userApiKey"}/"),
          body: {"driver_id": driverId},
          headers: {'Authorization': "Bearer $userToken"});
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return DriverPostModel.fromJson(jsonDecode(response.body));
      } else {
        throw 'something went wrong !';
      }
    } catch (e) {
      throw 'Something went wrong !';
    }
  }
}
