import 'dart:convert';
import 'package:mini_market_v1/models/products_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<List<ProductModel>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? listProducts = prefs.getString("products");
    if (listProducts != null) {
      Map<String, dynamic> listProductsMap = jsonDecode(listProducts);
      return listProductsMap["agendalist"].map<ProductModel>((productJson) => ProductModel.fromJson(productJson)).toList();
    }
    return [];
  }

  static Future<void> setProduct(ProductModel productModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("products", productModel.toJson());
  }
}
