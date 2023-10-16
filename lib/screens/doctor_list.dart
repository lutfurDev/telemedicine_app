import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';

import '../routes/app_pages.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/selected_county_widget.dart';
class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [SearchDoctorLayout(), sliverToBoxAdapter],
      ),
    );
  }
}


SliverAppBar  sliverAppBar(context) {
  return SliverAppBar(
    expandedHeight: AppLayout.getHeight(50),
    elevation: 0,
    leading: IconButton(onPressed: ()=>Get.back(),icon: const Icon(Icons.arrow_back_ios),),
    bottom: _subAppbar(context),
    title: Text(AppString.text_doctors,style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor,fontSize: Dimensions.fontSizeMid+2),),
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

_subAppbar(context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(120),
    child: Container(
      height: AppLayout.getHeight(22),
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radiusMid+5),
                topLeft: Radius.circular(Dimensions.radiusMid+5),)),
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
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
            child: AppInputField(title: "",hint: ""),
          ),
        ],
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
            onTap: ()=>Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          customSpacerWidth(width: 12),
          Text(
            AppString.text_doctors,
            style: AppStyle.title_text
                .copyWith(fontSize: Dimensions.fontSizeMid + 1,color: Theme.of(context).colorScheme.onPrimary),
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
              height: 50,
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
                _searchInputFieldLayout(
                    context: context,
                    onAction: (){},

                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  _searchInputFieldLayout({required BuildContext context,onAction}) {
    return Stack(
      children: [
        Positioned(
            child: GestureDetector(
              onTap: onAction,
              child: Padding(
                padding:  EdgeInsets.only(bottom: AppLayout.getHeight(6)),
                child: SizedBox(
                  width: AppLayout.getWidth(350),
                  child:   AppInputField(hint:AppString.text_enter_search.tr,isButtonExpanded: false,title: "",
                  isFieldTitleHide: true,
                    onAction: onAction,
                  ),
                ),
              ),
            )

        ),

      ],
    );
  }
}






SliverToBoxAdapter get sliverToBoxAdapter {
  return const SliverToBoxAdapter(
    child: Text(
        "Lorem Ipsum is simplyLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  );
}