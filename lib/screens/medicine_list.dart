import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/screens/product_details.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:telemedicine_app/utils/images.dart';
import 'package:telemedicine_app/widgets/custom_app_button.dart';
import 'package:telemedicine_app/widgets/custom_text_field.dart';
import '../controller/add_to_cart_controller.dart';
import '../controller/product_loaded_controller.dart';
import '../models/product_model.dart';
import '../widgets/all_view_item_widgets/all_view_widgets.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/home_view_widgets.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [const SearchDoctorLayout(), sliverToBoxAdapter(context)],
      ),
      floatingActionButton:  _buttonLayout(context)
      ,
    );
  }

  _buttonLayout(context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding:  const EdgeInsets.only(left: 34.0),
          child: SizedBox(
            height: AppLayout.getHeight(80),

            child: Center(
              child: Card(
                shape: roundedRectangleBorder,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(54),
                        width: AppLayout.getWidth(180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Obx(() =>   Text("${
                              Get.find<AddToCartController>().addToArray.length.toString()??0
                          } medicine added",style: AppStyle.normal_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeDefault),),),

                            Text("\$45",style: AppStyle.normal_text.copyWith(color: AppColor.primaryColor,fontSize: Dimensions.fontSizeDefault),)
                          ],
                        ),
                      ),
                      Expanded(child: AppButton(buttonText: AppString.text_countinue.tr, onPressed: ()=>Get.back(), buttonColor: AppColor.primaryColor,isButtonExpanded: false,)),
                    ],
                  ),
                ),
              ),
            ),
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
            AppString.text_medicin,
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
        padding:margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSpacerHeight(height: 12),
            _allItemsListLayout(context),
            customSpacerHeight(height: 12),

          ],
        ),
      ),
    ),

  );
}
_allItemsListLayout(context) {
  return Expanded(
    child: Column(
      children: [
        Expanded(
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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:5/6,
                      crossAxisSpacing: 6,mainAxisSpacing: 6

                  ),
                  itemCount: items.length,
                  padding: const EdgeInsets.all(0),
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
        ),
        customSpacerHeight(height: 270)

      ],
    ),
  );
}


