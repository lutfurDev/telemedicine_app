import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/screens/message.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'app_string.dart';
import 'images.dart';


List  get list=>_items;

List  get categoryIndex=>_categoryList;
List  get specialListIndex=>_specialList;

List  get bannerIndex=>_banners;
List  get onboardImageIndex=>_onboardImage;
List  get onboardTitleIndex=>_onboardTitle;
List  get flightCategoryIndex=>_flightCategory;
List  get offerCategoryIndex=>_offerCategoryList;
List  get onboardDescriptionIndex=>_onboardDescription;

List<String>  get countyList=>_county;
List<String>  get username=>_reviewerName;
List<String>  get dayIndex=>_day;
List<String>  get dayIndexC=>_dayCount;



List _categoryList = [
  "Trending",
  "Flight",
  "Hotel",

];

List _specialList = [
  "All",
  "Flight",

];


List _offerCategoryList = [
  "All",
  "Flight",  "Hotel",

];
List _flightCategory = [
  "One Way",
  "Round Way",  "Multi City",

];



List<String> _reviewerName = [
  "Tracy Mosby",
  "Cherub",
  "Angelic",
  "Rifat",
  "TurboSlayer",
];

List<String> _day = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",  "Fri",  "Sat",
];

List<String> _dayCount = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
];


final List _banners = [
  Images.group_doctor,
  Images.banner_4,
  Images.banner_1,
  Images.banner_2,
];

List<String> _items=[
  Images.paymet_cart_1,
  Images.paymet_cart_1,

];



final List _onboardImage = [
  Images.getOder,
  Images.confirm_oder,
  Images.payment,
];

final List _onboardTitle = [
  AppString.text_add_to_cart.tr,
  AppString.text_confirm_oder.tr,
  AppString.text_easy_safe_payment.tr,
];

final List _onboardDescription = [
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
];

final screensLayoutForBtnNav = <Widget>[
  const HomeScreen(),
  const MessageScreen(),
  const ProfileScreen(),
];

 List<String> _county = ['New York', 'Aurora County', 'Jones County', 'Austin County'];
