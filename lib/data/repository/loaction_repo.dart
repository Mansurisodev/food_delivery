import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/model/adress_model.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocationRepo {
  final ApiClent apiClent;
  final SharedPreferences sharedPreferences;

  LocationRepo({
    required this.apiClent,
    required this.sharedPreferences,
  });

  Future<Response> getAddressFromGoocode(LatLng latLng) async {
    return await apiClent.getData('${AppConstants.GEOCODE_URI}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS) ?? "";
  }

  Future<Response> addAddress(AddressModel addressModel) async {
    return await apiClent.posData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {
    return await apiClent.getData(AppConstants.ADD_LIST_URI);
  }

  Future<bool> svaeSaveAddress(String address) async {
    apiClent.updateHeader(sharedPreferences.getString(AppConstants.TOKEN)!);
    return await sharedPreferences.setString(AppConstants.USER_ADDRESS, address);
  }

  saveUserAddress(String userAddress) {}
}
