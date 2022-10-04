import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecommendedProductRepo extends GetxService {
  // String api = "https://mvs.bslmeiyu.com/api/v1/products/popular";
  final ApiClent apiClent;
  RecommendedProductRepo({required this.apiClent});

  Future<Response> getRecommendedProductList() async {
    return await apiClent.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
