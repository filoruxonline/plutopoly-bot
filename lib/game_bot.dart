import 'engine/data/map.dart';
import 'helper/game.dart';
import 'helper/game_listener.dart';

/// This is the main class where you can build your bot
/// documentation:
/// https://filoruxonline.github.io/plutopoly-bot-doc/index.html
/// the data object
/// https://filoruxonline.github.io/plutopoly-bot-doc/engine_data_main/GameData-class.html

class GameBot extends GameListener {
  // variables here are persisted (As long as the program keeps running)
  double raiseFactor = 1.05;

  /// onNewTurn gets called when all players have played 1 round.
  @override
  onNewTurn() {
    // This is an example project:
    // every turn all the tile prices raise by 5%.
    Game.data.gmap.forEach((Tile tile) {
      raisePrice(tile);
    });
    print("Raised price");
    // run Game.save() if you have changed data.
    Game.save();
  }

  // you can define your own functions:
  raisePrice(Tile tile) {
    
    //Not all tiles have prices (e.g. prison). You have to check
    //for null errors.
    if(tile.price == null) return;
    
    // vars in functions get resetted everytime they get called
    int previousPrice = tile.price;

    tile.price = (previousPrice * 1.05).floor();
  }

  /// These are other events you can listen to.
  /// gets called when the bot initializes
  @override
  onInit(bool previouslyInitialized) {}

  /// low-level, gets called when new data is received.
  @override
  onUpdate() {}
}
