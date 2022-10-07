import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foo_delivery/base/no_data_pages.dart';
import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/model/cart_model.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/app_icon.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:foo_delivery/widgets/small.text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList(); //3,2,3

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    ;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: Dimensions.height45),
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimensions.height10 * 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white),
                AppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.mainColor, backgroundColor: AppColors.yellowColor),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            var cartLength = _cartController.getCartHistoryList();
            return cartLength.length > 0
                ? Expanded(
                    child: Container(
                      // height: 500,
                      margin: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOrder.length; i++)
                              Container(
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(bottom: Dimensions.height20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeWidget(listCounter),
                                    SizedBox(height: Dimensions.height10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(itemsPerOrder[i], (index) {
                                            if (listCounter < getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    height: Dimensions.height20 * 4,
                                                    width: Dimensions.height20 * 4,
                                                    margin: EdgeInsets.only(right: Dimensions.width10 / 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(Dimensions.radius15 / 2),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          AppConstants.BASE_URL + AppConstants.UPLOAD_URL + getCartHistoryList[listCounter - 1].img!,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        Container(
                                          height: Dimensions.height20 * 4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SmallText(text: "Total", color: AppColors.titleColor),
                                              BigText(text: itemsPerOrder[i].toString() + "Items", color: AppColors.titleColor),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime = cartOrderTimeToList();
                                                  Map<int, CartModel> moreOrder = {};
                                                  for (var j = 0; j < getCartHistoryList.length; j++) {
                                                    if (getCartHistoryList[j].time == orderTime[i]) {
                                                      moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                                    }
                                                  }
                                                  Get.find<CartController>().setItems = moreOrder;
                                                  Get.find<CartController>().addToCartList();
                                                  Get.toNamed(RouteHelper.getCartPage());
                                                  // print("Order time" + orderTime[i].toString());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10 / 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                                                    border: Border.all(width: 1, color: AppColors.mainColor),
                                                  ),
                                                  child: SmallText(text: "one more", color: AppColors.mainColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(height: MediaQuery.of(context).size.height / 1.5, child: Center(child: const NoDataPage(text: "Your didn't buy anthing so far !", imgPath: "assets/images/empty_box.png")));
          })
        ],
      ),
    );
  }
}
