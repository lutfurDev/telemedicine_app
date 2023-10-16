import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_string.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../custom_spacer.dart';
import '../home_view_widgets.dart';
import '../selected_county_widget.dart';


Widget categoryLayoutView({ required context,required index, required currentIndex,required text,btnRadius}) {
  return Card(
      color: currentIndex == index
          ? AppColor.primaryColor
          : Theme.of(context).cardColor,
      elevation: 0,
      shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(btnRadius??Dimensions.radiusDefault)),
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              text,
              style: AppStyle.normal_text.copyWith(
                  color: currentIndex != index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeDefault),
            ),
          )));
}

class TopCategoryLayout extends StatelessWidget {
  const TopCategoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppLayout.getWidth(140),
      elevation: 0,
      leading: Row(
        children: [
          customSpacerWidth(width: 20),
          Icon(
            Icons.short_text,
            color: AppColor.cardColor,
            size: Dimensions.fontSizeExtraLarge + 7,
          ),
          customSpacerWidth(width: 12),
          Text(
            "Hello, Traveler",
            style: AppStyle.title_text
                .copyWith(fontSize: Dimensions.fontSizeMid + 1),
          )
        ],
      ),
      leadingWidth: AppLayout.getWidth(400),
      bottom: _subAppbar(context),
      pinned: true,
      backgroundColor: AppColor.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images.bg_2,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  _subAppbar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),

      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 78,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              padding: const EdgeInsets.only(top: 9, bottom: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _dashboardLayout(
                    context: context,
                    icon: Icons.medical_services_outlined,
                    onAction: ()=>Get.toNamed(Routes.FLIGHT),
                    text: AppString.text_doctors.tr,

                subtext: "Search doctors"
                ),
                const Spacer(),
                _dashboardLayout(
                    onAction: ()=>Get.toNamed(Routes.FLIGHT),
                    subtext: "Order medicine",

                    context: context, icon: CupertinoIcons.house, text: AppString.text_medicin.tr),
                const Spacer(),
                _dashboardLayout(
                    onAction: ()=>Get.toNamed(Routes.FLIGHT),
                    subtext: "Book test"
,
                    context: context,
                    icon: CupertinoIcons.train_style_two,
                    text: AppString.text_diagnostic.tr),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _dashboardLayout({required BuildContext context, text,subtext ,icon,onAction}) {
    return Stack(
      children: [
        Positioned(
            child: Column(
              children: [
                GestureDetector(
                  onTap: onAction,
                  child: SizedBox(
                    height: AppLayout.getHeight(64),
                    width: AppLayout.getWidth(75),
                    child: Card(
                      shape: cardStyle,
                      elevation: 0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      child: Icon(
                        icon,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                customSpacerHeight(height: 8),
                Text(
                  text,
                  style: AppStyle.normal_text_black
                      .copyWith(color: AppColor.normalTextColor),
                ),

                // Text(
                //   subtext,
                //   style: AppStyle.normal_text_black
                //       .copyWith(color: AppColor.normalTextColor.withOpacity(0.5),fontSize: Dimensions.fontSizeDefault-3),
                // )
              ],
            )),

      ],
    );
  }
}


