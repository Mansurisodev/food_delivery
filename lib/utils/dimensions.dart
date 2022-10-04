import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWeight = Get.context!.width;

  // Umumiy ekran height => 844 Containerimiz 220 = Shuning uchun bo7lamiz || 844/220 => 3.84
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  //Sizbox o'lchov birliklari  844 => /10/15/20
  // dinamic height =>  padding and margn
  static double height10 = screenHeight / 84.4; // => 10
  static double height15 = screenHeight / 56.27; // => 15
  static double height20 = screenHeight / 42.2; // = 20
  static double height30 = screenHeight / 28.13; // => 30
  static double height45 = screenHeight / 18.76; // => 30

  //dinamic weight => padding and margn
  static double width10 = screenHeight / 84.4; // => 10
  static double width15 = screenHeight / 56.27; // => 15
  static double width20 = screenHeight / 42.2; // => 20
  static double width30 = screenHeight / 28.13; // => 30

  // fonts

  static double font16 = screenHeight / 53.75; // => 20
  static double font20 = screenHeight / 42.2; // => 20
  static double font26 = screenHeight / 32.4; // => 26
  //radius
  static double radius15 = screenHeight / 56.27; // => 20
  static double radius20 = screenHeight / 42.2; // => 20
  static double radiu30 = screenHeight / 28.13; // => 30

  // icons size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //list view siz 390
  static double listViewImageSize = screenWeight / 3.25;
  static double listViewTextConatinerSize = screenWeight / 3.9;

  // popular food
  static double popularFoodImageSize = screenHeight / 2.41; // = > 240

  // bottom height
  static double bottomHeightBar = screenHeight / 7.03; // = > 240

  //splash srenn dimensions

  static double splashImg = screenHeight / 3.38; // = > 240

}
