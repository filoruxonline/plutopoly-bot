import 'engine/data/map.dart';
import 'helper/game.dart';
import 'helper/game_listener.dart';

class GameBot extends GameListener {
  @override
  onNewTurn() {
    print("onNewTurn");
    Game.data.gmap.forEach((Tile tile) {
      tile.price = (tile.price * 1.05).floor();
    });
    Game.save();
  }
}
