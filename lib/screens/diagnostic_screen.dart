import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/custom_app_button.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/home_view_widgets.dart';

class DiagnosticListScreen extends StatelessWidget {
  const DiagnosticListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [const SearchDoctorLayout(), sliverToBoxAdapter(context)],
      ),
      floatingActionButton: _buttonLayout(context),
    );
  }

  _buttonLayout(context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppLayout.getHeight(54),
                width: AppLayout.getWidth(180),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3 medicine added",
                        style: AppStyle.normal_text.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Dimensions.fontSizeDefault),
                      ),
                      Text(
                        "\$45",
                        style: AppStyle.normal_text.copyWith(
                            color: AppColor.primaryColor,
                            fontSize: Dimensions.fontSizeDefault),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: AppButton(
                buttonText: AppString.text_countinue.tr,
                onPressed: (){
                  Get.toNamed(Routes.DIAGNOSTIC_LIST_ADDED);
                },
                buttonColor: AppColor.primaryColor,
                isButtonExpanded: false,
              )),
            ],
          ),
        ));
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
            AppString.text_book_test.tr,
            overflow: TextOverflow.ellipsis,
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customSpacerHeight(height: 4),
      Text(
        AppString.text_top_specialist.tr,
        style: AppStyle.normal_text_black
            .copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 12,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return _offerViewLayout(context);
          },
        ),
      ),
      customSpacerHeight(height: 260)
    ],
  );
}

_offerViewLayout(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        height: AppLayout.getHeight(90),
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
                  customSpacerWidth(width: 48),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T3-T4-TSH",
                          style: AppStyle.normal_text_black.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        Text(
                          "12 mg",
                          style: AppStyle.normal_text_black.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.6),
                              fontSize: Dimensions.fontSizeDefault - 2),
                        ),

                        customSpacerHeight(height: 4),
                        Text(
                          "\$428",
                          style: AppStyle.title_text.copyWith(
                              color: AppColor.successColor,
                              fontSize: Dimensions.radiusMid - 3),
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
          width: AppLayout.getHeight(60),
          height: AppLayout.getHeight(60),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                image: DecorationImage(
                    image: AssetImage(Images.test), fit: BoxFit.fill)),
          ),
        ),
      ),
      Positioned(
          right: 8,
          bottom: 8,
          child: Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Icon(
                Icons.add,
                color: AppColor.primaryColor.withOpacity(0.8),
              )))
    ],
  );
}
