import 'package:flutter/material.dart';
import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/account_widget.dart';
import 'package:foo_delivery/widgets/app_icon.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: BigText(text: "Profile", size: 24, color: Colors.white),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              IconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        IconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "+ 99 899 325 30 01"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        IconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "mansuriosdevm1@gmail.com"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        IconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Fill in your address"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //adress
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        IconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Message"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //message
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedDate();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getsigInPage());
                        } else {
                          print("You logged out");
                        }
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          IconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Log Out"),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
