import 'package:flutter/material.dart';
import 'package:foo_delivery/base/custom_loader.dart';
import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/controllers/user_controller.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/account_widget.dart';
import 'package:foo_delivery/widgets/app_icon.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: BigText(text: "Profile", size: 24, color: Colors.white),
        backgroundColor: AppColors.mainColor,
      ),
      // Bu qisimda agar biz ro'yhatdan o'tganmagan bo'lsak Hech narsa chiqmaydi.Biz ro'yhatdan otsak ham server ishlamagani uchun vaqtincha o'chirib defolt ro'yhat yaratamiz
      body: GetBuilder<UserController>(
        builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
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
                                    // bigText: BigText(text: "+ 99 899 325 30 01"),
                                    bigText: BigText(text: userController.userModel.phone),
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
                                    // bigText: BigText(text: "mansuriosdevm1@gmail.com"),
                                    bigText: BigText(text: userController.userModel.email),
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
                                    // bigText: BigText(text: userController.userModel.phone),
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
                                    //Bu qisimda bizda server vatincha ishlamay qolganli sabbali false bo'lsa tizimdan chiqadi => defaul tarzda hamma narsani tozalaydi
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
                    )
                  : CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/signintocontinue.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getsigInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Center(child: BigText(text: "Sig in ", color: Colors.white, size: Dimensions.font26)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
