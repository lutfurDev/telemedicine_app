import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/utils/utils.dart';
import 'package:telemedicine_app/widgets/appointment_calendar.dart';
import 'package:telemedicine_app/widgets/calendar.dart';
import 'package:telemedicine_app/widgets/custom_app_button.dart';
import 'package:telemedicine_app/widgets/custom_spacer.dart';
import 'package:telemedicine_app/widgets/custom_titleText_layout.dart';
import '../utils/app_color.dart';
import '../utils/app_layout.dart';
import '../utils/app_string.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/home_view_widgets.dart';

class BookScreen extends StatelessWidget {
  final String? name;
  final String? drs;
  const BookScreen({super.key, this.name, this.drs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [const DoctorViewLayoutLayout(), sliverToBoxAdapter(context)],
      ),
    );
  }
}

SliverAppBar sliverAppBar(context) {
  return SliverAppBar(
    expandedHeight: AppLayout.getHeight(50),
    elevation: 0,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      AppString.text_doctors,
      style: AppStyle.title_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeMid + 2),
    ),
    pinned: true,
    backgroundColor: AppColor.primaryColor,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        Images.bg_2,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class DoctorViewLayoutLayout extends StatelessWidget {
  const DoctorViewLayoutLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppLayout.getWidth(120),
      elevation: 0,
      leading: Row(
        children: [
          customSpacerWidth(width: 20),
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          customSpacerWidth(width: 12),
          Text(
            AppString.text_doctors,
            style: AppStyle.title_text.copyWith(
                fontSize: Dimensions.fontSizeMid + 1,
                color: Theme.of(context).colorScheme.onPrimary),
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
      preferredSize: const Size.fromHeight(177),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              padding: const EdgeInsets.only(top: 9, bottom: 0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _doctorProfileDetailsLayout(
                  context: context,
                  onAction: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _doctorProfileDetailsLayout({required BuildContext context, onAction}) {
    return Stack(
      children: [
        Positioned(
            child: GestureDetector(
          onTap: onAction,
          child: Padding(
            padding: EdgeInsets.only(bottom: AppLayout.getHeight(6)),
            child: SizedBox(
              width: AppLayout.getWidth(350),
              child: _offerViewLayout(context),
            ),
          ),
        )),
      ],
    );
  }



}

SliverToBoxAdapter sliverToBoxAdapter(BuildContext context) {
  return SliverToBoxAdapter(
    child: SizedBox(
      child: Padding(
          padding: marginLayout.copyWith(top: 0),
          child: Column(
            children: [
              tileTextLayout(
                  context: context,
                  rightText: AppString.text__view_calendar.tr,
                  text: AppString.text_choose_your_slot.tr,
                  onAction: () => Get.to(const CalendarViewScreen())),
              _appointmentSlotLayout(),
              customSpacerHeight(height: 25),
              _buttonLayout()
            ],
          )),
    ),
  );
}

_appointmentSlotLayout() {
  return  const AppointmentScreen();
}

_buttonLayout() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: AppButton(
      buttonText: "Book",
      onPressed: () => Get.back(),
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    ),
  );
}

_offerViewLayout(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        height: AppLayout.getHeight(154),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(left: AppLayout.getWidth(24)),
            child: Card(
              elevation: 0,
              shape: roundedRectangleBorder.copyWith(
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              shadowColor: Colors.grey.withOpacity(0.2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSpacerWidth(width: 80),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr.Steve Robert",
                          style: AppStyle.normal_text_black.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        Text(
                          "B.sc DDDD",
                          style: AppStyle.normal_text_black.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.6),
                              fontSize: Dimensions.fontSizeDefault - 1),
                        ),
                        Text(
                          "Epidemiologist",
                          style: AppStyle.normal_text_black.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.6),
                              fontSize: Dimensions.fontSizeDefault - 1),
                        ),
                        customSpacerHeight(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.work_outline,
                              size: Dimensions.fontSizeDefault + 2,
                              color: AppColor.primaryColor,
                            ),
                            customSpacerWidth(width: 6),
                            Text(
                              "10 years experiences".tr,
                              style: AppStyle.normal_text_black.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeDefault - 1),
                            )
                          ],
                        ),
                        customSpacerHeight(height: 4),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.person_2_fill,
                              size: Dimensions.fontSizeDefault + 2,
                              color: AppColor.primaryColor,
                            ),
                            customSpacerWidth(width: 6),
                            Text(
                              "89% (433 votes )".tr,
                              style: AppStyle.normal_text_black.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeDefault - 1),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.star_fill,
                              size: Dimensions.fontSizeDefault + 2,
                              color: AppColor.primaryColor,
                            ),
                            customSpacerWidth(width: 6),
                            Text(
                              "4.5".tr,
                              style: AppStyle.normal_text_black.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeDefault - 1),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 26,
        child: SizedBox(
          width: AppLayout.getHeight(100),
          height: AppLayout.getHeight(76),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                image: DecorationImage(
                    image: AssetImage(Images.banner_1), fit: BoxFit.fill)),
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        left: 40,
        child: Text(
          "Open",
          style: AppStyle.title_text.copyWith(
              color: AppColor.successColor, fontSize: Dimensions.radiusMid - 3),
        ),
      )
    ],
  );
}

