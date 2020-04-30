import 'player.dart';
import '../../helper/game.dart';

part 'map.g.dart';

class MapConfiguration {
  List<int> configuration;

  int width = 11;

  MapConfiguration();
  MapConfiguration.standard() {
    width = 11;
    configuration = standardConfiguration;
  }
  MapConfiguration.dense() {
    width = 5;
    configuration = denseConfiguration;
  }
  factory MapConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MapConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$MapConfigurationToJson(this);
}

class Tile {
  TileType type = TileType.land;

  int color;

  String idPrefix;

  String name;

  int price;

  int hyp;

  int housePrice;

  List<int> rent;

  int level = 0;

  int idIndex = 1;

  bool mortaged = false;

  factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);

  Map<String, dynamic> toJson() => _$TileToJson(this);

  String get id => "$idPrefix:$idIndex";

  int get currentRent {
    if (mortaged ?? false) return 0;
    int _rentFactor = 1;
    if (type == TileType.trainstation) {
      return rent[owner.trainstations - 1];
    }
    if (type == TileType.company) {
      int _eyes = Game.data.currentDices.fold<int>(0, (a, b) => a + b);
      if (owner.companies == 2) {
        return _eyes * 10;
      } else {
        return _eyes * 4;
      }
    }
    if (rent == null) return 0;
    if (level == 0) {
      if (owner.hasAll(idPrefix)) _rentFactor *= 2;
    }
    if (level > rent.length) return 0;
    return rent[level] * _rentFactor;
  }

  int get index {
    return Game.data.gmap.indexWhere((tile) => tile.id == id);
  }

  Player get owner {
    Player owner;
    Game.data.players.forEach((Player player) {
      if (player.properties.contains(index)) {
        owner = player;
        return;
      }
    });
    return owner;
  }

  List<Player> get players {
    return Game.data.players
        .where((player) => player.position == index)
        .toList();
  }

  Tile(
    this.type, {
    this.color,
    this.idPrefix,
    this.name,
    this.price,
    this.housePrice,
    this.rent,
    this.hyp,
    this.mortaged: false,
    this.idIndex,
  });
}

enum TileType {
  land,

  company,

  trainstation,

  start,

  chest,

  tax,

  chance,

  jail,

  parking,

  police
}

List<int> standardConfiguration = [
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, //
  39, -1, -1, -1, -1, -1, -1, -1, -1, -1, 11, //
  38, -1, -1, -1, -1, -1, -1, -1, -1, -1, 12, //
  37, -1, -1, -1, -1, -1, -1, -1, -1, -1, 13, //
  36, -1, -1, -1, -1, -1, -1, -1, -1, -1, 14, //
  35, -1, -1, -1, -1, -1, -1, -1, -1, -1, 15, //
  34, -1, -1, -1, -1, -1, -1, -1, -1, -1, 16, //
  33, -1, -1, -1, -1, -1, -1, -1, -1, -1, 17, //
  32, -1, -1, -1, -1, -1, -1, -1, -1, -1, 18, //
  31, -1, -1, -1, -1, -1, -1, -1, -1, -1, 19, //
  30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, //
];

List<int> denseConfiguration = List.generate(100, (index) => index);
