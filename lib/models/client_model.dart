// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  final String name;
  final double sale;
  final double totalSales;

  ClientModel({
    required this.name,
    required this.sale,
    required this.totalSales,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'sale': sale,
      'totalSales': totalSales,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'] as String,
      sale: map['sale'] as double,
      totalSales: map['totalSales'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
