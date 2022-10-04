import 'package:foo_delivery/data/api/api_client.dart';
import 'package:foo_delivery/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularProductRepo extends GetxService {
  // String api = "https://mvs.bslmeiyu.com/api/v1/products/popular";
  final ApiClent apiClent;
  PopularProductRepo({required this.apiClent});

  Future<Response> getPopularProductList() async {
    return await apiClent.getData(AppConstants.POPUPAR_PRODUCT_URL);
  }
}
