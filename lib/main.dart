import 'package:PlutopolyExtension/helper/init_bot.dart';

//Enter a game pin here (replace null)
const String GAMEPIN = null;
//Enter a unique project name as author:botName
const String PROJECTNAME = "filorux.ex";

//If false it will not listen to any updates
//the bot will finish after the onInit() call
const bool GAMELISTENER = true;

//Go to lib/game_bot.dart to start building your Bot.

//OPTIONAL: extra metadata
const Map<String, dynamic> meta = {
  "projectname": PROJECTNAME,
  //Description, use \n for newline.
  "description":
      "A plutopoly bot\nThis is a very cool bot that brings the game to a totally new level.",
  "listen": GAMELISTENER,

  //overide the author name with your full name
  "author": null,
  //overide the botName with a full name
  "name": null,

  //add a website
  "website": null,
  //When false drops all received updates.
  //This could be changed in-game
  "active": true,
  "version": "0.0.0",
  //Marks the bot has been initialized
  "init": true
};

const bool VERBOSE = true;
void main() {
  InitHelper.initBot(GAMEPIN, VERBOSE, meta);
}
