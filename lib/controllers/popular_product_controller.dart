import 'package:flutter/material.dart';
import 'package:foo_delivery/controllers/cart_controller.dart';
import 'package:foo_delivery/data/repository/popular_product_repo.dart';
import 'package:foo_delivery/model/cart_model.dart';
import 'package:foo_delivery/model/product_model.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _ionCartItems = 0;
  int get ionCartItems => _ionCartItems + _quantity;

  // Get server
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  // Shop add
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print("numer of items " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("decrement " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_ionCartItems + quantity) < 0) {
      // Xabar beradi.20 dan kam bolsa
      Get.snackbar("Item count", "You can't reduce more !", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_ionCartItems > 0) {
        _quantity = -_ionCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_ionCartItems + quantity) > 20) {
      // Xabar beradi.20 dan kop bolsa
      Get.snackbar("Item count", "You can't add more !", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _ionCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _ionCartItems = _cart.getQuentity(product);
    }
    // print("the quantity in the cart is" + _ionCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _ionCartItems = _cart.getQuentity(product);

    // _cart.items.forEach((key, value) {
    //   // print("The id is  " + value.id.toString() + "The quantity is  " + value.quantity.toString());
    // });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
