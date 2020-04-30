import 'package:firedart/firedart.dart';
import '../engine/data/main.dart';
import 'dart:convert';
import '../main.dart';

class Game {
  static GameBot gameBot;

  ///The game pin. Please define in main.dart .
  static String gamePin;

  ///The serialized game data.
  static GameData data;

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
  static update(Document snap) {
    if (snap.map["bot"] ?? true) {
      if (Game.verbose) print("== Dropped Data ==");
      if (Game.verbose) print("bot field was true");
      return;
    }

    try {
      Game.data = GameData.fromJson(snap.map);
    } catch (e) {
      print("Couldn't serialize data. Are the versions correct?");
      rethrow;
    }
    Game.data.bot = true;
    if (Game.verbose) print("== Received Data ==");
    onUpdate();
    Map<String, dynamic> json = Game.data.toJson();

    if (Game.shouldSave) {
      Game.shouldSave = false;
      if (Game.data != null) {
        Game.data.bot = true;
        Firestore.instance.document("/games/${Game.gamePin}").update(json);
      } else {
        print("Game.data was null? ");
      }
    } else {
      if (Game.verbose)
        print("Didn't save: run Game.save() if you changed the data");
    }
  }

  static onUpdate() {
    Game.gameBot.onUpdate();
    if (turn == null) turn = Game.data.turn;
    if (turn < Game.data.turn) {
      turn = Game.data.turn;
      Game.gameBot.onNewTurn();
    }
  }

  static initBot(String inGamePin, bool inVerbose) async {
    Game.gameBot = GameBot();
    Game.verbose = inVerbose;
    if (inGamePin == null) {
      print("Please enter a GAMEPIN in main.dart");
      return;
    }
    Game.gamePin = inGamePin;
    try {
      Firestore.initialize("playplutopoly");
    } catch (e) {
      print("ERROR during initialization");
      rethrow;
    }
    try {
      DocumentReference documentReference =
          Firestore.instance.document("games/${Game.gamePin}");
      documentReference.stream.listen(update, onDone: () {
        print("== Stream ended ==");
      });
      try {
        Document document = await documentReference.get();
        JsonEncoder encoder = new JsonEncoder.withIndent('  ');
        String prettyprint = encoder.convert(document.map);
        if (Game.verbose) print(prettyprint);
      } catch (e) {
        if (Game.verbose) print("Couldn't pretty print.");
      }
    } catch (e) {
      print("ERROR during connection: Is your gamepin correct?");
      rethrow;
    }
  }
}
