part 'ui_actions.g.dart';

class UIActionsData {
  bool shouldMove = true;

  bool showDealScreen = false;

  UIActionsData();

  factory UIActionsData.fromJson(Map<String, dynamic> json) =>
      _$UIActionsDataFromJson(json);
  Map<String, dynamic> toJson() => _$UIActionsDataToJson(this);

  void loadActionScreen() {}
}
