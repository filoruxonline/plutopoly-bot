part 'deal_data.g.dart';

class DealData {
  int payAmount = 0;

  List<int> receivableProperties = [];

  List<int> receiveProperties = [];

  List<int> payableProperties = [];

  List<int> payProperties = [];

  int price = 0;

  List<bool> valid = [true, true];

  bool playerChecked = false;

  bool dealerChecked = false;

  int dealer;
  DealData();
  factory DealData.fromJson(Map<String, dynamic> json) =>
      _$DealDataFromJson(json);
  Map<String, dynamic> toJson() => _$DealDataToJson(this);
}
