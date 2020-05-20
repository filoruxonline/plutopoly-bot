import 'dart:convert';
import 'dart:io';

import 'package:PlutopolyExtension/engine/data/main_data.dart';
import 'package:firedart/firedart.dart';

import '../game_bot.dart';
import 'game.dart';

const String version = "0.3.0";

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
      Game.logger.e("Please enter a GAMEPIN in main.dart");
      return;
    }
    Game.gamePin = inGamePin;
    try {
      Firestore.initialize("playplutopoly");
    } catch (e) {
      Game.logger.e("Error during initialization", e);
      exit(0);
    }
    try {
      DocumentReference documentReference =
          Firestore.instance.document("games/${Game.gamePin}");
      if (meta["listen"] ?? true) {
        documentReference.stream.listen(Helper.update, onDone: () {
          Game.logger.w("== Stream ended ==");
        });
      } else {
        if (Game.verbose)
          Game.logger.i("Meta listen value was false, not listening to data.");
      }
      Document document = await documentReference.get();

      List<int> versionCode =
          version.split(".").map<int>((e) => int.tryParse(e)).toList();

      String joinVersion = document.map["version"] ?? "0.0.0";
      List<int> joinVersionCode =
          joinVersion.split(".").map<int>((e) => int.tryParse(e)).toList();
      if (joinVersionCode.length >= 2 && versionCode[0] != null) {
        if (joinVersionCode[0] != versionCode[0] ||
            joinVersionCode[1] != versionCode[1]) {
          Game.logger.e(Exception(
              "The versions are not correct:\nyour version: $version\ngame version: $joinVersion"));
        }
      } else {
        Game.logger.e("Couldn't proces version: $joinVersion", Exception());
        exit(0);
      }

      try {
        JsonEncoder encoder = new JsonEncoder.withIndent('  ');
        String prettyprint = encoder.convert(document.map);
        if (Game.verbose) Game.logger.v(prettyprint);
      } catch (e) {
        if (Game.verbose) Game.logger.w("Couldn't pretty print.");
      }

      try {
        Game.data = GameData.fromJson(document.map);
      } catch (e) {
        Game.logger.e(
          "Couldn't serialize data. Is the json formatted correctly? Are the versions correct?",
          e,
        );
        exit(0);
      }
      try {
        previouslyInitialized =
            document.map["bots"][Game.projectName]["meta"]["init"] ?? false;
      } catch (e) {}
    } catch (e) {
      Game.logger.e("ERROR during connection: Is your gamepin correct?", e);
      exit(0);
    }

    Game.gameBot.onInit(previouslyInitialized);
    Helper.saveGame();
  }

  static Map<String, dynamic> checkMetaData(Map<String, dynamic> meta) {
    if (meta == null) {
      Game.logger.e("Meta data was null");
      exit(0);
    }

    String projectName = meta["projectname"];
    if (projectName == null || projectName == "") {
      Game.logger.e(
          "Please enter a unique project name",
          null,
          StackTrace.fromString(
              "lib/main.dart (package:PlutopolyExtension/main.dart:6:1)"));
      exit(0);
    }

    List<String> projectNameParts = projectName.split(".");
    if (projectNameParts.length != 2) {
      Game.logger.e(
          "Use exactly 1 point (.) in the project name",
          null,
          StackTrace.fromString(
              "lib/main.dart (package:PlutopolyExtension/main.dart:6:1)"));
      exit(0);
    }
    if (projectNameParts[0].length < 3) {
      Game.logger.e(
          "Add a author name with atleast 3 characters before the point in your project name",
          null,
          StackTrace.fromString(
              "lib/main.dart (package:PlutopolyExtension/main.dart:6:1)"));
      exit(0);
    }
    if (projectNameParts[1].length < 3) {
      Game.logger.e(
          "Add a name with atleast 3 characters after the point in your project name",
          null,
          StackTrace.fromString(
              "lib/main.dart (package:PlutopolyExtension/main.dart:6:1)"));
      exit(0);
    }
    if (projectNameParts[0] == "filorux") {
      // Go to lib/main.dart
      Game.logger.e(
          "Replace filorux with your own name in your project name.",
          null,
          StackTrace.fromString(
              "lib/main.dart (package:PlutopolyExtension/main.dart:6:1)"));
      exit(0);
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
