import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/controllers/location_controller.dart';
import 'package:foo_delivery/controllers/popular_product_controller.dart';
import 'package:foo_delivery/controllers/recommended_product_controller.dart';
import 'package:foo_delivery/controllers/user_controller.dart';
import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/data/repository/auth_repo.dart';
import 'package:foo_delivery/data/repository/cart_repo.dart';
import 'package:foo_delivery/data/repository/loaction_repo.dart';
import 'package:foo_delivery/data/repository/popular_product_repo.dart';
import 'package:foo_delivery/data/repository/recomended_product_repo.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/data/repository/user_repo.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClent(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClent: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClent: Get.find()));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClent: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClent: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClent: Get.find(), sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
