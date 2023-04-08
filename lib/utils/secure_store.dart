import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  static Future<void> saveToken(String token) async {
    const data = FlutterSecureStorage();
    await data.write(key: "Token", value: token);
  }

  static Future<void> saveApiKey(String apiKey) async {
    const data = FlutterSecureStorage();
    await data.write(key: "key", value: apiKey);
    await data.read(key: "key");
  }

  static Future<String> getApiKey() async {
    const data = FlutterSecureStorage();
    String? apikey = await data.read(key: "key");
    log(apikey.toString());
    return apikey.toString();
  }

  static Future<String> getToken() async {
    const data = FlutterSecureStorage();
    String? token = await data.read(key: "Token");
    log("getTokn$token");
    return token.toString();
  }
}
