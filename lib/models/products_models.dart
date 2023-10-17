// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  final String unit;
  final int quantity;
  final DateTime expirationDate;

  ProductModel({
    required this.name,
    required this.unit,
    required this.quantity,
    required this.expirationDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'unit': unit,
      'quantity': quantity,
      'expirationDate': expirationDate,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      unit: map['unit'] as String,
      quantity: map['quantity'] as int,
      expirationDate: map['expirationDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel copyWith({
    String? name,
    String? unit,
    int? quantity,
    DateTime? expirationDate,
  }) {
    return ProductModel(
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  static List<ProductModel> mockProducts() {
    return [
      ProductModel(name: 'Arroz', unit: 'kg', quantity: 10, expirationDate: _parseDate('30/10/2023')),
      ProductModel(name: 'Feijão', unit: 'kg', quantity: 5, expirationDate: _parseDate('15/11/2023')),
      ProductModel(name: 'Macarrão', unit: 'pç', quantity: 8, expirationDate: _parseDate('20/11/2023')),
      ProductModel(name: 'Açúcar', unit: 'kg', quantity: 12, expirationDate: _parseDate('05/12/2023')),
      ProductModel(name: 'Café', unit: 'g', quantity: 150, expirationDate: _parseDate('10/12/2023')),
      ProductModel(name: 'Leite', unit: 'L', quantity: 6, expirationDate: _parseDate('15/12/2023')),
      ProductModel(name: 'Ovos', unit: 'dz', quantity: 4, expirationDate: _parseDate('20/12/2023')),
      ProductModel(name: 'Sal', unit: 'g', quantity: 300, expirationDate: _parseDate('25/12/2023')),
      ProductModel(name: 'Sabonete', unit: 'un', quantity: 3, expirationDate: _parseDate('30/12/2023')),
      ProductModel(name: 'Shampoo', unit: 'ml', quantity: 500, expirationDate: _parseDate('05/01/2024')),
      ProductModel(name: 'Condicionador', unit: 'ml', quantity: 450, expirationDate: _parseDate('10/01/2024')),
      ProductModel(name: 'Escova de Dentes', unit: 'un', quantity: 2, expirationDate: _parseDate('15/01/2024')),
      ProductModel(name: 'Pasta de Dentes', unit: 'g', quantity: 200, expirationDate: _parseDate('20/01/2024')),
      ProductModel(name: 'Tomate', unit: 'kg', quantity: 7, expirationDate: _parseDate('25/01/2024')),
      ProductModel(name: 'Cebola', unit: 'kg', quantity: 6, expirationDate: _parseDate('01/02/2024')),
      ProductModel(name: 'Batata', unit: 'kg', quantity: 9, expirationDate: _parseDate('06/02/2024')),
      ProductModel(name: 'Banana', unit: 'kg', quantity: 4, expirationDate: _parseDate('11/02/2024')),
      ProductModel(name: 'Maçã', unit: 'kg', quantity: 3, expirationDate: _parseDate('16/02/2024')),
      ProductModel(name: 'Abacaxi', unit: 'un', quantity: 1, expirationDate: _parseDate('21/02/2024')),
    ];
  }

  static DateTime _parseDate(String dateString) {
    final parts = dateString.split('/');
    return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }
}
