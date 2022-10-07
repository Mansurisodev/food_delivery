import 'package:flutter/material.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  AppTextFiled({Key? key, required this.textEditingController, required this.hintText, required this.icon, this.isObscure = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: AppColors.yellowColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiu30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
        ),
      ),
    );
  }
}
