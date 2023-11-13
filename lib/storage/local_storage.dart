import 'dart:convert';
import 'package:mini_market_v1/models/client_model.dart';
import 'package:mini_market_v1/models/sales_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<List<SalesModel>> getSales() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? listSales = prefs.getString("sales");
    if (listSales != null) {
      Map<String, dynamic> listSalesMap = jsonDecode(listSales);
      return listSalesMap["sales"].map<SalesModel>((salesJson) => SalesModel.fromJson(salesJson)).toList();
    }
    return [];
  }

  static Future<void> setSale(SalesModel salesModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sales", salesModel.toJson());
  }

  static Future<List<SalesModel>> getClients() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? listSales = prefs.getString("clients");
    if (listSales != null) {
      Map<String, dynamic> listSalesMap = jsonDecode(listSales);
      return listSalesMap["sales"].map<SalesModel>((salesJson) => SalesModel.fromJson(salesJson)).toList();
    }
    return [];
  }

  static Future<void> setClient(ClientModel clientModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("clients", clientModel.toJson());
  }
}
