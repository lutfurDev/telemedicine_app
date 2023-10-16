import 'package:telemedicine_app/models/product_model.dart';
import 'package:get/get.dart';


class WishlistController extends GetxController {
  RxList wishlist = [].obs;


   RxList<int> indexArray = <int>[].obs;

   RxList<ProductModel> wishlistIndex = <ProductModel>[].obs;

addToWishListByIndex({int? id}){

  if(indexArray.contains(id)){
    indexArray.remove(id);
    print("remove ::; $id");
  }else{
    indexArray.add(id!);
    print("added ::; $indexArray");
  }

}

addToWishList(ProductModel productModel){
  if(wishlistIndex.contains(productModel)){
    wishlistIndex.remove(productModel);
    print(wishlistIndex.length);
  }else{
    wishlistIndex.add(productModel);
    print(wishlistIndex.length);
  }
}



// removeToWishList(value){
//   addWishListList.remove(value);
// }


}

