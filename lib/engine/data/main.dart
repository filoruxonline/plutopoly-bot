import '../data/extensions.dart';
import '../extensions/bank/data/bank_data.dart';
import 'deal_data.dart';
import 'map.dart';
import 'player.dart';
import 'settings.dart';
import 'ui_actions.dart';

part 'main.g.dart';

class GameData {
  bool running;

  List<Player> players = [];

  int currentPlayer = 0;

  int turn = 1;

  List<int> currentDices = [1, -1];

  int doublesThrown = 0;

  double pot = 0;

  List<Tile> gmap = [];

  Settings settings = Settings();

  List<Extension> extensions = [];

  UIActionsData ui = UIActionsData();

  bool rentPayed = false;

  int findingsIndex = 0;

  int eventIndex = 0;

  String mapConfiguration = "classic";

  DealData dealData = DealData();

  BankData bankData;

  String version = "0";

  List<Player> lostPlayers = [];

  bool bot = false;

  GameData();

  factory GameData.fromJson(Map<String, dynamic> json) =>
      _$GameDataFromJson(json);
  Map<String, dynamic> toJson() => _$GameDataToJson(this);

  Player get player {
    if (currentPlayer < 0) {
      currentPlayer = players.length - 1;
    }
    return players[currentPlayer];
  }
}
