import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/widgets/custom_spacer.dart';
import 'package:telemedicine_app/widgets/selected_county_widget.dart';
import '../utils/app_layout.dart';
import '../utils/app_string.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/utils.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/category_widgets/category_widgets.dart';
import '../widgets/home_view_widgets.dart';



class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
var currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(
          context: context,
          text:AppString.text_offer.tr,
          argumentVal: true,
          notAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN),
          ),
      body: Padding(
        padding: marginLayout.copyWith(left: AppLayout.getHeight(8),right: AppLayout.getWidth(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hotDealsLayout(context),
            customSpacerHeight(height: 8),
            _offerViewLayout(context),
          ],
        ),
      ),
    );
  }

  _hotDealsLayout(BuildContext context) {

    return SizedBox(
      height: AppLayout.getHeight(50),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offerCategoryIndex.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                currentIndex=index;
              });
            },
            child: categoryLayoutView(
                context: context,index: index,currentIndex: currentIndex,
                text: offerCategoryIndex[index]
            ),
          );
        },),
    );

  }

  _offerViewLayout(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4.8 / 6,
            crossAxisSpacing: 6,mainAxisSpacing: 6
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, index) {
          return _offerView(context);
        },
      ),
    );

  }

_offerView(BuildContext context) {
  return  Card(
    elevation: 0,
    shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    shadowColor: Colors.grey.withOpacity(0.2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppLayout.getHeight(100),
          width: MediaQuery.of(context).size.width,
          child:Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusDefault),topRight: Radius.circular(Dimensions.radiusDefault)),
                image: DecorationImage(image: AssetImage(Images.travel),fit: BoxFit.fill)
            ),
          ),
        ),

         Padding(
           padding: const EdgeInsets.all(4.0),
           child: SizedBox(
             width: AppLayout.getWidth(90),

             child: Card(
               elevation: 0,
            shape: cardStyle,
            color: AppColor.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.airplanemode_on_rounded,color: AppColor.primaryColor,size: 21,),
                  customSpacerWidth(width: 8),
                  Text(AppString.text_flight,style: AppStyle.normal_text_black.copyWith(fontSize: Dimensions.fontSizeDefault,overflow: TextOverflow.ellipsis),)
                ],
              ),
            ),
        ),),
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
  );
}
}
