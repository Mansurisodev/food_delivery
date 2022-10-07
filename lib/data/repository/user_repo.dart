import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClent apiClent;
  UserRepo({required this.apiClent});

  Future<Response> getUserInfo() async {
    return await apiClent.getData(AppConstants.USER_INFO_URI);
  }
}
