import 'package:telemedicine_app/controller/input_controller.dart';
import 'package:telemedicine_app/controller/product_loaded_controller.dart';
import 'package:telemedicine_app/models/product_model.dart';
import 'package:telemedicine_app/routes/app_pages.dart';
import 'package:telemedicine_app/screens/product_details.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/all_view_item_widgets/all_view_widgets.dart';
import 'package:telemedicine_app/widgets/auth_view_widget.dart';
import 'package:telemedicine_app/widgets/custom_spacer.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';
import 'package:telemedicine_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_string.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, text: AppString.text_view_all.tr, argumentVal: true,notAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN)),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding:margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchFieldLayout(context),
            customSpacerHeight(height: 12),
            _allItemsListLayout(context),
            customSpacerHeight(height: 12),

          ],
        ),
      ),
    );
  }

  _searchFieldLayout(context) {
    return Row(
      children: [
        Expanded(
            child: AppInputField(
              onAction: () => Get.toNamed(Routes.SEARCH_SCREEN),
              title: AppString.text_search.tr,
              hint: AppString.text_enter_search.tr,
              controller: InputController().searchController,
              isFieldTitleHide: true,
              isReadVal: true,
            )),
        _filterLayout(Theme.of(context).primaryColor, AppColor.cardColor),
      ],
    );
  }

  _filterLayout(bgColor, iconColor) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.FILTER_SCREEN),
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


  _allItemsListLayout(context) {
    return Expanded(
      child: FutureBuilder(
        future: ProductLoaded().loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.data ??""}"),
            );
          } else if (snapshot.hasData) {
            var items = snapshot.data as List<ProductModel>;
            return GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:5/6,
                  crossAxisSpacing: 6,mainAxisSpacing: 6

              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return allItemViewWidget(context: context,
                  itemIndex: items[index],
                  image: items[index].image,
                  price: items[index].price,
                  itemName: items[index].title.toString(),
                  placeholder: items[index].image,
                  index: index,
                  isHideToast: false,
                  onAction: ()=>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          title: items[index].title.toString(),
                          drc: items[index].description.toString(),
                          cetText: items[index].category.toString(),
                          price: items[index].price.toString(),
                          image: items[index].image,
                          index: items[index],
                          rating: items[index].rating?.rate.toString(),
                        ),
                      )),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}
