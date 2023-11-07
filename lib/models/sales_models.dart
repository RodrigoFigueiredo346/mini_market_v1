import 'dart:convert';

class SalesModel {
  final double value;
  final String client;
  final DateTime saledate;

  SalesModel({
    required this.value,
    required this.client,
    required this.saledate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'client': client,
      'saledate': saledate.millisecondsSinceEpoch,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      value: map['value'] as double,
      client: map['client'] as String,
      saledate: DateTime.fromMillisecondsSinceEpoch(map['saledate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesModel.fromJson(String source) => SalesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<SalesModel> mockProducts() {
    return [
      SalesModel(value: 100, client: 'João Pedro da Silva', saledate: _parseDate('30/10/2023')),
      SalesModel(value: 80.40, client: 'Mario Pedro da Silva', saledate: _parseDate('20/09/2023')),
      SalesModel(value: 52.56, client: 'Maria Joana Dutra', saledate: _parseDate('05/08/2023')),
    ];
  }

  static DateTime _parseDate(String dateString) {
    final parts = dateString.split('/');
    return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }
}
