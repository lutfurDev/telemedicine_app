import 'dart:convert';

import 'package:telemedicine_app/utils/images.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:telemedicine_app/models/product_model.dart';

class ProductLoaded{
  Future<List<ProductModel>> loadProducts() async {
    final jsonString = await rootBundle.loadString(Images.products_model);
    final jsonData = json.decode(jsonString);
    final products =
    (jsonData as List).map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }
}