import '../../helper/game.dart';
import '../ai/ai.dart';
import '../extensions/bank/data/loan.dart';
import 'info.dart';
import 'map.dart';

part 'player.g.dart';

class Player {
  String name = "null";

  double money = 0;

  int position = 0;

  int get id => Game.data.players.indexWhere((Player p) => p.name == name);

  int color = 0;

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

  List<Contract> loans = [];

  Map<String, int> stock = {};

  AI ai;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Tile get positionTile => Game.data.gmap[position];
  int get index => Game.data.players.indexOf(this);
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

  List<Tile> get transtationTiles {
    List<Tile> _trainsTations = [];
    properties.forEach((int i) {
      Tile tile = Game.data.gmap[i];
      if (tile.type == TileType.trainstation) {
        _trainsTations.add(tile);
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
    return missing(idPrefix) == 0;
  }

  bool hasAllUnmortaged(String idPrefix) {
    bool has = true;
    Game.data.gmap.asMap().forEach((int i, Tile tile) {
      if (tile.idPrefix == idPrefix) {
        if (!properties.contains(i)) {
          has = false;
          return;
        } else {
          if (tile.mortaged) has = false;
        }
      }
    });
    return has;
  }

  int missing(String idPrefix) {
    int mis = 0;
    Game.data.gmap.asMap().forEach((int i, Tile tile) {
      if (tile.idPrefix == idPrefix && !properties.contains(i)) {
        mis++;
      }
    });
    return mis;
  }

  Player({
    this.money = 0,
    this.color = 9688,
    this.position: 0,
    this.name,
    this.code,
    this.ai,
  }) {
    if (name == null) {
      name = "Player $id";
    }
    moneyHistory.add(money);
  }

  @override
  String toString() {
    return 'Player(name: $name, money: $money, position: $position, color: $color, properties: $properties, jailed: $jailed, jailTries: $jailTries, goojCards: $goojCards, moneyHistory: $moneyHistory, code: $code, debt: $debt, loans: $loans, ai: $ai)';
  }
}
