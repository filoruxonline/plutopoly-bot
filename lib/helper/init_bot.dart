import 'dart:convert';
import 'dart:io';

import 'package:PlutopolyExtension/engine/data/main.dart';
import 'package:firedart/firedart.dart';

import '../main.dart';
import 'game.dart';

class InitHelper {
  static initBot(
      String inGamePin, bool inVerbose, Map<String, dynamic> meta) async {
    Game.gameBot = GameBot();
    bool previouslyInitialized = false;

    meta = checkMetaData(meta);
    if (inGamePin == null) {
      print("Please enter key:");
      inGamePin =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')).trim();
    }

    Game.botData = {"meta": meta};

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
      if (meta["listen"] ?? true) {
        documentReference.stream.listen(Helper.update, onDone: () {
          print("== Stream ended ==");
        });
      } else {
        if (Game.verbose)
          print("Meta listen value was false, not listening to data.");
      }
      Document document = await documentReference.get();
      try {
        JsonEncoder encoder = new JsonEncoder.withIndent('  ');
        String prettyprint = encoder.convert(document.map);
        if (Game.verbose) print(prettyprint);
      } catch (e) {
        if (Game.verbose) print("Couldn't pretty print.");
      }
      try {
        Game.data = GameData.fromJson(document.map);
      } catch (e) {
        print(
            "Couldn't serialize data. Is the json formatted correctly? Are the versions correct?");
        rethrow;
      }
      try {
        previouslyInitialized =
            document.map["bots"][Game.projectName]["meta"]["init"] ?? false;
      } catch (e) {}
    } catch (e) {
      print("ERROR during connection: Is your gamepin correct?");
      rethrow;
    }

    Game.gameBot.onInit(previouslyInitialized);
    Helper.saveGame();
  }

  static Map<String, dynamic> checkMetaData(Map<String, dynamic> meta) {
    if (meta == null) {
      throw Exception("Meta data was null");
    }

    String projectName = meta["projectname"];
    if (projectName == null || projectName == "") {
      throw Exception("Please enter a unique project name");
    }

    List<String> projectNameParts = projectName.split(".");
    if (projectNameParts.length != 2) {
      throw Exception("Use exactly 1 point (.) in the project name");
    }
    if (projectNameParts[0].length < 3) {
      throw Exception(
          "Add a author name with atleast 3 characters before the point in your project name");
    }
    if (projectNameParts[1].length < 3) {
      throw Exception(
          "Add a name with atleast 3 characters after the point in your project name");
    }
    if (projectNameParts[0] == "filorux") {
      throw Exception(
          "Replace filorux with your own name in your project name");
    }

    if (meta["author"] == null || meta["author"] == "") {
      meta["author"] == projectNameParts[0];
    }

    if (meta["name"] == null || meta["name"] == "") {
      meta["name"] == projectNameParts[1];
    }

    return meta;
  }
}
