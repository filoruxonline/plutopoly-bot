import '../helper/game.dart';

import 'data/main.dart';
import 'data/map.dart';
import 'data/player.dart';

// Used for ui
class Alert {
  String title = "";
  String content = "";
  bool closable = true;
  bool snackbar = false;
  bool failed = true;
  Alert(
    this.title,
    this.content, {
    this.closable: true,
    this.failed: true,
    this.snackbar: false,
  }) {
    print("ALERT $title \n$content");
  }
  Alert.funds([Player player]) {
    print("ALERT Player does not have enough money");
  }
  Alert.snackBar(this.title, [this.content]) {}
}

enum PayType { rent, bank, pot, pay }

class CoreActions {
  GameData get data => Game.data;
  CoreActions();

  Alert mortage(int tileIndex) {
    Alert alert;
    Tile tile = data.gmap[tileIndex];
    if (tile.hyp == null)
      return Alert("Couldn't mortage", "You can't mortage this tile.");
    bool _mortaged = tile.mortaged;
    if (_mortaged) {
      alert = pay(PayType.bank, (tile.hyp * 1.1).toInt());
      if (alert != null) return alert;
      tile.mortaged = false;
      alert = Alert.snackBar("Lifted mortaged " + tile.name);
    } else {
      pay(PayType.bank, -tile.hyp);
      tile.mortaged = true;
      alert = Alert.snackBar("Mortaged " + tile.name);
    }
    Game.save();
    return alert;
  }

  Alert pay(PayType type, int amount,
      {int receiver, bool count: false, bool force: false}) {
    if (!force) {
      if (amount > 0) {
        if (data.player.money < amount) return Alert.funds();
      } else if (amount < 0 && receiver != null) {
        Player _player = data.players[receiver];
        if (_player.money < -amount) return Alert.funds(_player);
      }
    }
    if (receiver != null) data.players[receiver].money += amount;
    data.player.money -= amount;
    switch (type) {
      case PayType.rent:
        data.rentPayed = true;

        break;
      case PayType.pot:
        data.rentPayed = true;
        data.pot += amount;
        break;
      default:
    }
    Game.save();
    return null;
  }

  Alert clearPot() {
    data.player.money += data.pot;
    data.pot = 0;
    Game.save();
    return Alert.snackBar("Emptied pot");
  }

  Alert payRent(int tileIndex, [int payPrice, bool force = false]) {
    Tile tile = data.gmap[tileIndex];
    int price = payPrice ?? tile.currentRent;
    int receiver = tile.owner.index;
    return pay(PayType.rent, price,
        receiver: receiver, count: true, force: force);
  }

  Alert deal({
    int payAmount: 0,
    List<int> payProperties: const <int>[],
    List<int> receiveProperties: const <int>[],
    int dealer,
  }) {
    if (payAmount != null) {
      Alert alert = pay(PayType.pay, payAmount, receiver: dealer);
      if (alert != null) {
        return alert;
      }
    }
    if (payProperties != null) {
      for (int i = 0; i < payProperties.length | 0; i++) {
        data.player.properties.remove(payProperties[i]);
        data.players[dealer].properties.add(payProperties[i]);
      }
    }
    if (receiveProperties != null) {
      for (int i = 0; i < receiveProperties.length; i++) {
        data.players[dealer].properties.remove(receiveProperties[i]);
        data.player.properties.add(receiveProperties[i]);
      }
    }
    data.player.properties.sort();
    data.players[dealer].properties.sort();
    Game.save();
    return null;
  }

  Alert buy([int price, int prop]) {
    Alert alert;
    if (prop == null) prop = data.player.position;
    if (price == null) price = data.gmap[prop].price;
    if (data.gmap[prop].owner != null) {
      return Alert("Couldn't buy", "The property is already owned");
    }
    if (data.gmap[prop].type == TileType.land ||
        data.gmap[prop].type == TileType.trainstation ||
        data.gmap[prop].type == TileType.company) {
      alert = pay(PayType.bank, price, count: true);
      if (alert != null) return alert;
      data.player.properties.add(prop);
      data.player.properties.sort();
      Game.save();
    } else {
      return Alert("Couldn't buy", "The property is from the wrong type.");
    }
    return null;
  }
}
