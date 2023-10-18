import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/screens/doctor_view_details.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/home_view_widgets.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [const SearchDoctorLayout(), sliverToBoxAdapter(context)],
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

class SearchDoctorLayout extends StatelessWidget {
  const SearchDoctorLayout({super.key});
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
      preferredSize: const Size.fromHeight(86),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 40,
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
                _searchInputFieldLayout(
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

  _searchInputFieldLayout({required BuildContext context, onAction}) {
    return Stack(
      children: [
        Positioned(
            child: GestureDetector(
          onTap: onAction,
          child: Padding(
            padding: EdgeInsets.only(bottom: AppLayout.getHeight(6)),
            child: SizedBox(
              width: AppLayout.getWidth(350),
              child: AppInputField(
                hint: AppString.text_enter_search.tr,
                isButtonExpanded: false,
                title: "",
                isFieldTitleHide: true,
                onAction: onAction,
              ),
            ),
          ),
        )),
      ],
    );
  }
}

SliverToBoxAdapter sliverToBoxAdapter(context) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: marginLayout.copyWith(top: 0),
        child: _doctorsLayout(context),
      ),
    ),
  );
}

_doctorsLayout(BuildContext context) {
  return ListView.builder(
   physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(8),
    itemBuilder: (context, index) {
       return _offerViewLayout(context);
    },
  );
}

_offerViewLayout(BuildContext context) {
  return GestureDetector(
    onTap: ()=>Get.toNamed(Routes.DOCTOR_PROFILE_VIEW),
    child: Stack(
      children: [
        SizedBox(
          height: AppLayout.getHeight(138),
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
                                fontSize: Dimensions.fontSizeDefault - 2),
                          ),
                          Text(
                            "Epidemiologist",
                            style: AppStyle.normal_text_black.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.6),
                                fontSize: Dimensions.fontSizeDefault - 2),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.clock,
                                size: Dimensions.fontSizeDefault + 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.6),                              ),
                              customSpacerWidth(width: 4),
                              Text(
                                "9.30AM - 8.30PM".tr,
                                style: AppStyle.normal_text_black.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.6),
                                    fontSize: Dimensions.fontSizeDefault - 2),
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
          top: 15,
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
          child: Text("Open",style: AppStyle.title_text.copyWith(color: AppColor.successColor,fontSize: Dimensions.radiusMid-3),),
        )
      ],
    ),
  );
}
