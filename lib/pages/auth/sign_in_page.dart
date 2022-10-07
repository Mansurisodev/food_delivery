import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foo_delivery/base/custom_loader.dart';
import 'package:foo_delivery/base/show_custom_snack_bar.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/pages/auth/sign_up_page.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/app_text_filed.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emialController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String email = emialController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar("Type in your email adress", title: "Email adress");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email adress", title: "Valid email adress");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (!status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
            // Get.toNamed(RouteHelper.getCartPage());
            print("Succes registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
        // Get.toNamed(RouteHelper.getInitial());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        //app logo
                        Container(
                          height: Dimensions.screenHeight * 0.25,
                          child: Center(
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("assets/images/logo part 1.png"),
                            ),
                          ),
                        ),
                        //Hello
                        Container(
                          margin: EdgeInsets.only(left: Dimensions.width20),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello", style: TextStyle(fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2, fontWeight: FontWeight.bold)),
                              Text("Sign into your account", style: TextStyle(fontSize: Dimensions.font20, color: Colors.grey[500])),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        //email
                        AppTextFiled(textEditingController: emialController, hintText: "Email", icon: Icons.email),
                        SizedBox(height: Dimensions.height20),
                        //password
                        AppTextFiled(textEditingController: passwordController, hintText: "Password", icon: Icons.password, isObscure: true),
                        SizedBox(height: Dimensions.height20),

                        SizedBox(height: Dimensions.height10),
                        //Have an account alredy?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Container()),
                            RichText(
                              text: TextSpan(
                                text: "Sign into your account",
                                style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font20),
                              ),
                            ),
                            SizedBox(width: Dimensions.width20),
                          ],
                        ),
                        //
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        //sigin
                        GestureDetector(
                          onTap: () {
                            _login(authController);
                          },
                          child: Container(
                            width: Dimensions.screenWeight / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radiu30),
                              color: AppColors.mainColor,
                            ),
                            child: Center(child: BigText(text: "Sign In", size: Dimensions.font20 + Dimensions.font20 / 2, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: Dimensions.screenHeight * 0.05),

                        RichText(
                          text: TextSpan(
                            text: "Don't an account?",
                            style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font20),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SigUpPage(), transition: Transition.fade),
                                text: " Create?",
                                style: TextStyle(color: AppColors.mainBlackColor, fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
