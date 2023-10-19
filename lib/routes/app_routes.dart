part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH_SCREEN = _Paths.MAIN;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const OTP = _Paths.OTP;
  static const ONBOARD_SCREEN = _Paths.ONBOARD_SCREEN;
  static const HOME = _Paths.HOME;
  static const MAIN = _Paths.MAIN;
  static const CART = _Paths.CART;
  static const FAVORITE = _Paths.FAVORITE;
  static const PROFILE = _Paths.PROFILE;
  static const ORDER = _Paths.ORDER;
  static const PRODUCT_DEATAILS = _Paths.PRODUCT_DEATAILS;
  static const VIEW_ALL = _Paths.VIEW_ALL;
  static const SEARCH_SCREEN = _Paths.SEARCH_SCREEN;
  static const NOTIFICATION_SCREEN = _Paths.NOTIFICATION_SCREEN;
  static const MY_CART_SCREEN = _Paths.MY_CART_SCREEN;
  static const PAYMENT_METHOD_SCREEN = _Paths.PAYMENT_METHOD_SCREEN;
  static const ADD_PAYMENT_METHOD = _Paths.ADD_PAYMENT_METHOD;
  static const ADD_SHPPING_ADDRESS = _Paths.ADD_SHPPING_ADDRESS;
  static const MY_REVIEW = _Paths.MY_REVIEW;
  static const SETTING_SCREEN = _Paths.SETTING_SCREEN;
  static const FILTER_SCREEN = _Paths.FILTER_SCREEN;
  static const PRODUCT_REVIEW_SCREEN = _Paths.PRODUCT_REVIEW_SCREEN;
  static const WRITE_REVIEW_SCREEN = _Paths.WRITE_REVIEW_SCREEN;
  static const SHIPPING_ADDRESS = _Paths.SHIPPING_ADDRESS;
  static const EDIT_SHIPPING_ADDRESS = _Paths.EDIT_SHIPPING_ADDRESS;
  static const MY_PRIFILE = _Paths.MY_PRIFILE;
  static const CAHANGE_PASSWORD = _Paths.CAHANGE_PASSWORD;
  static const FLIGHT = _Paths.FLIGHT;
  static const DOCTOR_LIST = _Paths.DOCTOR_LIST;
  static const DOCTOR_PROFILE_VIEW = _Paths.DOCTOR_PROFILE_VIEW;
  static const MESSAGE_UI = _Paths.MESSAGE_UI;
  static const MEDICINE_LIST = _Paths.MEDICINE_LIST;

}

abstract class _Paths {
  _Paths._();

  static const SPLASH_SCREEN = '/splash-screen';
  static const SIGN_IN = '/signIn-screen';
  static const SIGN_UP = '/signUp-screen';
  static const FORGOT_PASSWORD = "/forgot-screen";
  static const OTP = "/otp-screen";
  static const PRODUCT_DEATAILS = "/product_details-screen";
  static const ONBOARD_SCREEN = "/onboard-screen";
  static const HOME = "/home_screen";
  static const MAIN = "/main_screen";
  static const CART = "/cart_screen";
  static const FAVORITE = "/favorite_screen";
  static const PROFILE = "/profile_screen";
  static const ORDER = "/order_screen";
  static const VIEW_ALL = "/view_all_screen";
  static const SEARCH_SCREEN = "/search_screen";
  static const NOTIFICATION_SCREEN = "/notification_screen";
  static const MY_CART_SCREEN = "/my_cart_screen";
  static const PAYMENT_METHOD_SCREEN= "/payment_method_screen_v";
  static const ADD_PAYMENT_METHOD= "/add_payment_method_screen";
  static const ADD_SHPPING_ADDRESS= "/add_shopping_screen";
  static const MY_REVIEW= "/my_review_screen";
  static const SETTING_SCREEN= "/setting_screen";
  static const FILTER_SCREEN= "/filter_screen";
  static const PRODUCT_REVIEW_SCREEN= "/product_screen";
  static const WRITE_REVIEW_SCREEN= "/write_review_screen";
  static const SHIPPING_ADDRESS= "/shipping_screen";
  static const EDIT_SHIPPING_ADDRESS= "/edit_shipping_screen";
  static const MY_PRIFILE= "/my_profile_screen";
  static const CAHANGE_PASSWORD= "/change_pass_screen";
  static const FLIGHT= "/flight_screen";
  static const DOCTOR_LIST= "/doctor_list_screen";
  static const DOCTOR_PROFILE_VIEW= "/doctor_profile_view_screen";
  static const MESSAGE_UI= "/message_screen_ui";
  static const MEDICINE_LIST= "/medicine_screen_list";


}
