import 'package:telemedicine_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/add_to_cart_controller.dart';
import '../../utils/app_string.dart';
import '../custom_snakbar.dart';
import '../popular_item_widgets/popular_item_widgets.dart';

Widget allItemViewWidget(
    {required BuildContext context,
    image,
    price,
    itemName,
    placeholder,
    itemIndex,
    onAction,
    index,
    bool isHideToast = true}) {
  return Card(
    elevation: 0,
    shape: roundedRectangleBorder,
    shadowColor: Colors.grey.withOpacity(0.2),
    child: Stack(
      children: [
        productViewLayout(
          image: image,
          price: price.toString(),
          productName: itemName.toString(),
          placeholder: image,
          context: context,
          onAction: onAction,
        ),
        Obx(() => wishListLayout(index, itemIndex)),
        addItemLayout(onAction: () {
          Get.find<AddToCartController>().totalPrice.value =
              Get.find<AddToCartController>().totalPrice.value + price;
          Get.find<AddToCartController>()
              .addToCart(productModel: itemIndex, context: context);

        }),
      ],
    ),
  );
}
