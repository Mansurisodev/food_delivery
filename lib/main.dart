import 'package:flutter/material.dart';
import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/controllers/popular_product_controller.dart';
import 'package:foo_delivery/controllers/recommended_product_controller.dart';
import 'package:foo_delivery/pages/auth/sign_in_page.dart';
import 'package:foo_delivery/pages/auth/sign_up_page.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:get/get.dart';
import 'helper/dependeccies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Demo",
          home: SignInPage(),
          // initialRoute: RouteHelper.getInitial(),
          // home: SplashScreen(),
          // // initialRoute: RouteHelper.getSplashPage(),
          // getPages: RouteHelper.routes,
        );
      });
    });
  }
}
