import 'package:flutter/material.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:get/instance_manager.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("I am orintting laoding state " + Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height20 * 5,
        width: Dimensions.height20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20 * 5 / 2),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
