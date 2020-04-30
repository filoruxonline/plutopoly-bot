import '../extensions/bank/data/loan.dart';
import 'info.dart';
import 'map.dart';
import '../../helper/game.dart';
part 'player.g.dart';

class Player {
  String name;

  double money;

  int position;

  int color;

  List<int> properties = [];

  bool jailed = false;

  int jailTries = 0;

  int goojCards = 0;

  Map<int, List<UpdateInfo>> info = {
    0: [UpdateInfo(title: "New game")],
    1: []
  };

  List<double> moneyHistory = [0];

  int code = 0;

  double debt = 0;

  List<dynamic> loans = [];

  Map<String, int> stock = {};

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  int get trainstations {
    int _trainsTations = 0;
    properties.forEach((int i) {
      Tile tile = Game.data.gmap[i];
      if (tile.type == TileType.trainstation) {
        _trainsTations++;
      }
    });
    return _trainsTations;
  }

  int get companies {
    int _companies = 0;
    properties.forEach((int i) {
      Tile tile = Game.data.gmap[i];
      if (tile.type == TileType.company) _companies++;
    });
    return _companies;
  }

  bool hasAll(String idPrefix) {
    bool hasAll = true;
    Game.data.gmap.asMap().forEach((int i, Tile tile) {
      if (tile.idPrefix == idPrefix && !properties.contains(i)) {
        hasAll = false;
        return;
      }
    });
    return hasAll;
  }

  Player({
    this.money = 0,
    this.color = 9688,
    this.position: 0,
    this.name,
    this.code,
  }) {
    if (name == null) {
      name = "Player";
    }
    moneyHistory.add(money);
  }
}
