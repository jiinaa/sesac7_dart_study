import 'dart:convert';
import 'dart:io';

class CollectionSalePrice {
  double price;
  String cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
  : price = json['price'],
  cvtDatetime = json['cvtDatetime'];
}

class Chart {
  String collectionName;
  CollectionSalePrice collectionSalePrice;
  
  Chart.fromJson(Map<String, dynamic> json)
  : collectionName = json['collectionName'],
  collectionSalePrice = CollectionSalePrice.fromJson(json['collectionSalePrice']);
}

readJsonFile() {
  try {
    final jsonFile = File('lib/assets/chart_data.json').readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(jsonFile);
    final Chart chart = Chart.fromJson(json);
    return chart;
  } catch (e) {
    print('Error $e');
  }
}