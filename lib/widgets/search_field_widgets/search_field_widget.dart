
import 'package:telemedicine_app/controller/input_controller.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget searchFieldWidget({context,filterAction,searchAction}){
  return Row(
    children: [
      Expanded(
          child: AppInputField(
            onAction:()=>Get.toNamed(searchAction),
            title: AppString.text_search.tr,
            hint: AppString.text_enter_search.tr,
            controller: InputController().searchController,
            isFieldTitleHide: true,
            isReadVal: true,
          )),
      _filterLayout(Theme.of(context).primaryColor, AppColor.cardColor,filterAction),
    ],
  );
}

_filterLayout(bgColor, iconColor,filterAction) {
  return Container(
    margin: const EdgeInsets.only(left: 12),
    child: GestureDetector(
      onTap: ()=>Get.toNamed(filterAction),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppColor.primaryColor,
        child: SizedBox(
            height: AppLayout.getHeight(24),
            child: Lottie.asset(Images.filter)),
      ),
    ),
  );
}
