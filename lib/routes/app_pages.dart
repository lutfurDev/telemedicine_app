import 'package:telemedicine_app/screens/add_payment_method.dart';
import 'package:telemedicine_app/screens/book_screen.dart';
import 'package:telemedicine_app/screens/diagnostic_screen.dart';
import 'package:telemedicine_app/screens/doctor_list.dart';
import 'package:telemedicine_app/screens/forget_password.dart';
import 'package:telemedicine_app/screens/my%20reviews.dart';
import 'package:telemedicine_app/screens/notification.dart';
import 'package:telemedicine_app/screens/otp_verification.dart';
import 'package:telemedicine_app/screens/product_details.dart';
import 'package:telemedicine_app/screens/profile.dart';
import 'package:telemedicine_app/screens/setting.dart';
import 'package:telemedicine_app/screens/sign_in.dart';
import 'package:telemedicine_app/screens/sing_up.dart';
import 'package:get/get.dart';
import '../screens/change_password.dart';
import '../screens/chating_screen.dart';
import '../screens/diagnostic_added_view.dart';
import '../screens/doctor_view_details.dart';
import '../screens/home.dart';
import '../screens/main.dart';
import '../screens/medicine_list.dart';
import '../screens/onboarding.dart';
import '../screens/payment_method.dart';
import '../screens/product_review.dart';
import '../screens/search_screen.dart';
import '../screens/splash.dart';
import '../screens/view_profile.dart';
import '../screens/write_a_review.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.BOOK_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      transition: Transition.size,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.MAIN,
      transition: Transition.size,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      transition: Transition.size,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      transition: Transition.size,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      transition: Transition.size,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      transition: Transition.size,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      transition: Transition.size,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      transition: Transition.size,
      page: () => const ForgetPassword(),
    ),
    GetPage(
      name: _Paths.OTP,
      transition: Transition.size,
      page: () => const OTPScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DEATAILS,
      transition: Transition.size,
      page: () => const ProductDetails(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      transition: Transition.size,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      transition: Transition.size,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: _Paths.ADD_PAYMENT_METHOD,
      transition: Transition.size,
      page: () => const AddPaymentMethod(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD_SCREEN,
      transition: Transition.size,
      page: () => const PaymentMethodScreen(),
    ),
    GetPage(
      name: _Paths.MY_REVIEW,
      transition: Transition.size,
      page: () => const MyReviewScreen(),
    ),
    GetPage(
      name: _Paths.BOOK_SCREEN,
      transition: Transition.size,
      page: () => const BookScreen(),
    ),
    GetPage(
      name: _Paths.SETTING_SCREEN,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCT_REVIEW_SCREEN,
      page: () => const ProductReview(),
    ),
    GetPage(
      name: _Paths.WRITE_REVIEW_SCREEN,
      page: () => const WriteAReview(),
    ),
    GetPage(
      name: _Paths.MY_PRIFILE,
      page: () => const ViewProfile(),
    ),
    GetPage(
      name: _Paths.CAHANGE_PASSWORD,
      page: () => ChangePassword(),
    ),
    GetPage(
      name: _Paths.DOCTOR_LIST,
      transition: Transition.size,
      page: () => const DoctorListScreen(),
    ),
    GetPage(
      name: _Paths.DOCTOR_PROFILE_VIEW,
      transition: Transition.size,
      page: () => const DoctorViewDetails(),
    ),
    GetPage(
      name: _Paths.MESSAGE_UI,
      transition: Transition.size,
      page: () => const MessageUIScreen(),
    ),
    GetPage(
      name: _Paths.MEDICINE_LIST,
      transition: Transition.size,
      page: () => const MedicineListScreen(),
    ),
    GetPage(
      name: _Paths.DIAGNOSTIC_LIST,
      transition: Transition.size,
      page: () => const DiagnosticListScreen(),
    ),
    GetPage(
      name: _Paths.DIAGNOSTIC_LIST_ADDED,
      transition: Transition.size,
      page: () => const DiagnosticListAddedViewScreen(),
    ),
  ];
}
