import 'dart:math';

import 'stock.dart';

part 'bank_data.g.dart';

class BankData {
  int expendature = 0;

  List<int> expandatureList = [500];

  int bullPoints = 0;

  int volatility = 5;

  Stock worldStock = Stock.world();

  BankData() {
    bullPoints = Random().nextInt(200) - 100;
  }

  factory BankData.fromJson(Map<String, dynamic> json) =>
      _$BankDataFromJson(json);
  Map<String, dynamic> toJson() => _$BankDataToJson(this);
}
