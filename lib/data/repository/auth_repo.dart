import 'dart:async';

import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/model/signup_body_model.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClent apiClent;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClent,
    required this.sharedPreferences,
  });
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClent.posData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  Future<Response> login(String email, String passord) async {
    return await apiClent.posData(AppConstants.LOGIN_URI, {"email": email, "passsword": passord});
  }

  Future<bool> saveUserToken(String token) async {
    apiClent.token = token;
    apiClent.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> svaeUserNumerNadPassword(String numer, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, numer);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearShared() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClent.token = '';
    apiClent.updateHeader((''));
    return true;
  }
}
