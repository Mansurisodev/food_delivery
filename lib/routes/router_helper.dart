import 'package:foo_delivery/pages/address/ad_address_page.dart';
import 'package:foo_delivery/pages/auth/sign_in_page.dart';
import 'package:foo_delivery/pages/cart/cart_page.dart';
import 'package:foo_delivery/pages/food/popiular_food_detail.dart';
import 'package:foo_delivery/pages/food/recomended_fodd_detail.dart';
import 'package:foo_delivery/pages/home/home_page.dart';

import 'package:foo_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendeFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String sigIn = "/sign-in";
  static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendeFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getsigInPage() => '$sigIn';
  static String getAddresssPage() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: sigIn, page: () => SignInPage(), transition: Transition.fade),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendeFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecomendFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: addAddress,
        page: () {
          return AddAddressPage();
        })
  ];
}
