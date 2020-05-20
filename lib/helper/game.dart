import 'package:firedart/firedart.dart';
import 'package:logger/logger.dart';

import '../engine/data/main_data.dart';
import '../game_bot.dart';

class Game {
  static GameBot gameBot;

  static Logger logger = Logger(printer: PrettyPrinter(lineLength: 50));

  ///The game pin. Please define in main.dart .
  static String gamePin;

  ///The serialized game data.
  static GameData data;

  ///JSON Bot data that gets saved online.
  ///note: key "meta" is already used
  static Map<String, dynamic> botData;

  static bool get active => botData["meta"]["active"] ?? true;
  static String get projectName => botData["meta"]["projectname"] ?? "null";

  static bool shouldSave = false;
  static bool verbose = false;

  ///Please only run this if you changed something.
  ///The game will only be saved 1 time after all event listeners.
  static save() {
    shouldSave = true;
  }
}

class Helper {
  static int turn;
  static int currentPlayer;

  static update(Document snap) {
    if (snap.map["bot"] ?? true) {
      if (Game.verbose)
        Game.logger.v(["== Dropped Data ==", "bot field was true"]);
      return;
    }

    try {
      Game.data = GameData.fromJson(snap.map);
    } catch (e) {
      Game.logger.e("Couldn't serialize data. Are the versions correct?");
      rethrow;
    }
    Game.data.bot = true;
    if (snap.map["bots"] != null) {
      Game.botData = snap.map["bots"][Game.projectName] ?? Game.botData;
    }

    if (!Game.active) {
      if (Game.verbose)
        Game.logger.v(["== Dropped Data ==", "bot was marked inactive"]);
      return;
    }

    if (Game.verbose) Game.logger.v("== Received Data ==");
    onUpdate();

    if (Game.shouldSave) {
      saveGame();
    } else {
      if (Game.verbose)
        Game.logger.i("Didn't save: run Game.save() if you changed the data");
    }
  }

  static saveGame() {
    Map<String, dynamic> json = Game.data.toJson();

    Game.shouldSave = false;
    if (Game.data != null) {
      if (json["bots"] == null) json["bots"] = {};
      json["bots"][Game.projectName] = Game.botData;
      Firestore.instance.document("/games/${Game.gamePin}").update(json);
    } else {
      Game.logger.wtf("Game.data was null? ");
    }
  }

  static onUpdate() {
    Game.gameBot.onUpdate();
    if (turn == null) turn = Game.data.turn;
    if (turn < Game.data.turn) {
      turn = Game.data.turn;
      Game.gameBot.onNewTurn();
    }
    if (currentPlayer == null) currentPlayer = Game.data.currentPlayer;
    if (currentPlayer != Game.data.currentPlayer &&
        Game.data.ui.shouldMove == false) {
      currentPlayer = Game.data.currentPlayer;
      Game.gameBot.onNextPlayer();
    }
  }

  /// Use InitHelper.initBot()
  @deprecated
  static initBot() {}
}
