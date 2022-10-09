class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  // static const String BASE_URL = "http://127.0.0.1:8000";
  // static const String BASE_URL = " http://localhost:80000";

  static const String BASE_URL = "https://mvs.bslmeiyu.com";
  static const String POPUPAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";
  // static const String DRINC_URI = "/api/v1/products/drincks";
  static const String UPLOAD_URL = "/uploads/";

  //user auth end poind
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  //new
  static const String USER_ADDRESS = "user_address";
  static const String ADD_USER_ADDRESS = "/api/v1/cusotmer/address/add";
  static const String ADD_LIST_URI = "/api/v1/cusotmer/address/list";

  static const String GEOCODE_URI = "/api/v1/config/geocode-api";

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}
