import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/app_text_filed.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class SigUpPage extends StatelessWidget {
  const SigUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emialController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var sigupImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emialController.text.trim();
      String password = passwordController.text.trim();
      if (name.isEmpty) {
      } else if (phone.isEmpty) {
      } else if (email.isEmail) {
      } else if (GetUtils.isEmail(email)) {
      } else if (password.isEmpty) {}
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            //email
            AppTextFiled(textEditingController: emialController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            //password
            AppTextFiled(textEditingController: passwordController, hintText: "Password", icon: Icons.password),
            SizedBox(height: Dimensions.height20),
            //Name
            AppTextFiled(textEditingController: nameController, hintText: "Name", icon: Icons.person),
            SizedBox(height: Dimensions.height20),
            //Phone
            AppTextFiled(textEditingController: phoneController, hintText: "Phone", icon: Icons.phone),
            SizedBox(height: Dimensions.height20),
            //Sig Up
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWeight / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiu30),
                  color: AppColors.mainColor,
                ),
                child: Center(child: BigText(text: "Sign Up", size: Dimensions.font20 + Dimensions.font20 / 2, color: Colors.white)),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            //Have an account alredy?
            RichText(
              text: TextSpan(
                text: "Have an account alredy?",
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font20),
              ),
            ),
            //
            SizedBox(height: Dimensions.screenHeight * 0.05),
            //sigup options
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following methods?",
                style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font16),
              ),
            ),
            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: Dimensions.radiu30,
                          backgroundImage: AssetImage("assets/images/" + sigupImages[index]),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
