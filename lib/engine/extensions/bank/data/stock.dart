import '../../../../helper/game.dart';

part 'stock.g.dart';

class Stock {
  String id = "";

  double value;

  int volume;

  String info;

  Map<int, double> valueHistory = {0: 100};

  Stock({
    this.id,
    this.value,
    this.volume,
    this.info: "",
  }) : valueHistory = {Game.data?.turn ?? 0: value};

  Stock.world() {
    id = "WORLD_STOCK";
    value = 100;
    volume = 100;
    info =
        "This is a world index fund. It represents the world average stock value. Buying fee: 5%";
  }

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}
