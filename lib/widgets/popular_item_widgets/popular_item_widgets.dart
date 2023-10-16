import 'package:telemedicine_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/add_to_cart_controller.dart';
import '../../controller/wishList_controller.dart';
import '../../models/product_model.dart';
import '../../utils/app_color.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import '../custom_spacer.dart';


Widget popularItemWidget({required BuildContext context,index,onAction,image,price,title,placeholder,itemIndex}){
  return Padding(
    padding: const EdgeInsets.only(right: 6.0),
    child: Stack(
      children: [
        Card(
          elevation: 0,
          shape: roundedRectangleBorder,
          shadowColor: Colors.grey.withOpacity(0.2),
          child: GestureDetector(
            onTap:onAction,
            child: productViewLayout(
                image: image,
                price: price.toString(),
                productName: title.toString(),
                placeholder: image,
              context: context

            ),
          ),
        ),
        Obx(
              () => wishListLayout(index, itemIndex),
        ),
        addItemLayout(onAction: () {
          Get.find<AddToCartController>().totalPrice.value =
              Get.find<AddToCartController>().totalPrice.value +
                  price;
          Get.find<AddToCartController>().addToCart(
              productModel: itemIndex, context: context);
        }),
      ],
    ),
  );

}

wishListLayout(index, ProductModel items) {
  var controller = Get.find<WishlistController>();
  return Positioned(
    top: 6,
    left: 6,
    child: GestureDetector(
        onTap: () {
          controller.addToWishList(items);
          controller.addToWishListByIndex(id: items.id);
        },
        child: controller.indexArray.contains(items.id)
            ? Icon(
          Icons.favorite,
          color: AppColor.primaryColor,
        )
            : const Icon(Icons.favorite_border)),
  );
}

addItemLayout({onAction}) {
  return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: onAction,
        child: Card(
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiusLarge),
                  bottomRight: Radius.circular(Dimensions.radiusMid - 4))),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.add,
              color: AppColor.cardColor,
            ),
          ),
        ),
      ));
}

















productViewLayout({image, productName, status, required price, placeholder, required BuildContext context,onAction}) {
  return Padding(
    padding: const EdgeInsets.only(right: 6.0),
    child: GestureDetector(
      onTap: onAction,
      child: SizedBox(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productImage(image: image, placeholder: placeholder),
              _productInfo(
                  context: context,
                  status: status,
                  price: price,
                  productName: productName),
            ],
          ),
        ),
      ),
    ),
  );
}

_productImage({image, placeholder}) {
  return Expanded(
    child: FadeInImage(
      image: AssetImage(image),
      placeholder: AssetImage(placeholder),
      imageErrorBuilder: (context, error, stackTrace) {
        return SizedBox(
            height: AppLayout.getHeight(110),
            width: AppLayout.getWidth(120),
            child: Image.asset(placeholder));
      },
      fit: BoxFit.contain,
    ),
  );
}

_productInfo({required BuildContext context, status, price, productName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customSpacerHeight(height: 16),
      Text(
        status ?? "BEST SELLER",
        overflow: TextOverflow.ellipsis,
        style: AppStyle.normal_text.copyWith(
            color: AppColor.primaryColor, overflow: TextOverflow.ellipsis),
      ),
      Text(
        productName,
        overflow: TextOverflow.ellipsis,
        style: AppStyle.normal_text.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeMid - 2,
        ),
      ),
      Text(
        "\$$price",
        overflow: TextOverflow.ellipsis,
        style: AppStyle.normal_text.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Dimensions.fontSizeMid - 2),
      ),
    ],
  );
}