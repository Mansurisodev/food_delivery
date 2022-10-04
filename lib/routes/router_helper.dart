import 'package:foo_delivery/pages/cart/cart_page.dart';
import 'package:foo_delivery/pages/food/popiular_food_detail.dart';
import 'package:foo_delivery/pages/food/recomended_fodd_detail.dart';
import 'package:foo_delivery/pages/home/home_page.dart';
import 'package:foo_delivery/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendeFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendeFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        }),
    GetPage(
        name: recommendeFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return RecomendFoodDetail(pageId: int.parse(pageId!), page: page!);
        }),
    GetPage(
      name: cartPage,
      transition: Transition.fadeIn,
      page: () {
        return CartPage();
      },
    ),
  ];
}
