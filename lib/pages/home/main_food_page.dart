import 'package:flutter/material.dart';
import 'package:foo_delivery/pages/home/food_page_body.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:foo_delivery/widgets/small.text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());

    return Scaffold(
      body: Column(
        children: [
          // header
          Container(
            // Appbar qism
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //countr and City Bangladesh // Narsingdi icons
                  Column(
                    children: [
                      BigText(text: "Bangladesh", color: AppColors.mainColor, size: 20),
                      Row(
                        children: [
                          SmallText(text: "Narsingdi", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  //search
                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(top: 45, bottom: 15),
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //body
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
