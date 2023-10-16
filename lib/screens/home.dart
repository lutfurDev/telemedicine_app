import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/auth_view_widget.dart';
import 'package:telemedicine_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import '../routes/app_pages.dart';
import '../utils/utils.dart';
import '../widgets/category_widgets/category_widgets.dart';
import '../widgets/custom_titleText_layout.dart';
import '../widgets/home_view_widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  var  specialIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [const TopCategoryLayout(), sliverToBoxAdapter],
      ),
    );
  }



  SliverToBoxAdapter get sliverToBoxAdapter {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: marginLayout.copyWith(left: 12,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSpacerHeight(height: 25),
           _bannerLayout(),
            customSpacerHeight(height: 8),
            tileTextLayout(context: context, text: AppString.text_doctor_nearly_you.tr, onAction: () => Get.toNamed(Routes.VIEW_ALL)),
            _doctorsLayout(context),
            customSpacerHeight(height: 8),

            tileTextLayout(context: context, text: AppString.text_fratured.tr, onAction: (){},isHideText: true),
            customSpacerHeight(height: 8),
            _featuredLayout(context),
            customSpacerHeight(height: 12),
          ],
        ),
      ),
    );
  }

  _bannerLayout() {
    return SizedBox(
      height: AppLayout.getHeight(178),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: bannerIndex.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: SizedBox(
              width: AppLayout.getWidth(300),
              child: Card(
                elevation: 0,
                shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
                shadowColor: Colors.grey.withOpacity(0.2),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault-1),
                        image: DecorationImage(image: AssetImage(bannerIndex[index]),fit: BoxFit.fill)
                    ),
                  ),
                ),
              ),
            ),
          );
        },),
    );




  }


  _doctorsLayout(BuildContext context) {
    return SizedBox(
      height: AppLayout.getHeight(110),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
        return _offerViewLayout(context);
      },),
    );
  }

  _offerViewLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Stack(
        children: [
          SizedBox(
            height: AppLayout.getHeight(110),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.only(left: AppLayout.getWidth(24)),
                child: Card(
                  elevation: 0,
                  shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
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
                            Text("Dr.Steve Robert",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                            Text("B.sc DDDD",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),fontSize: Dimensions.fontSizeDefault-2),),
                            Text("Epidemiologist",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),fontSize: Dimensions.fontSizeDefault-2),),

                            const Spacer(),

                            Row(
                              children: [
                                Icon(Icons.star,size: Dimensions.fontSizeDefault+3,color: AppColor.primaryColor,),
                                customSpacerWidth(width: 2),
                                Text("5.6".tr,style:AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),fontSize: Dimensions.fontSizeDefault-2),)
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
            child:  SizedBox(width:AppLayout.getHeight(100) ,
              height: AppLayout.getHeight(76),

              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  image: DecorationImage(image: AssetImage(Images.banner_1),fit: BoxFit.fill)
                ),
              ),
            ),),



        ],
      ),
    );
  }





  _specialOfferView(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: SizedBox(
        width: AppLayout.getWidth(230),
        child: Card(
          elevation: 0,
          shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          shadowColor: Colors.grey.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppLayout.getHeight(115),
                width: MediaQuery.of(context).size.width,
                child:Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusDefault),topRight: Radius.circular(Dimensions.radiusDefault)),
                      image: DecorationImage(image: AssetImage(Images.offer),fit: BoxFit.fill)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lorem Ipsum is simply dummy text of the printing",maxLines: 3,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeDefault-1,overflow: TextOverflow.ellipsis),),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  _featuredLayout(BuildContext context) {
    return SizedBox(
      height: AppLayout.getHeight(200),

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),

        itemBuilder: (context, index) {
          return _specialOfferView(context);
        },),
    );

  }

  
}


