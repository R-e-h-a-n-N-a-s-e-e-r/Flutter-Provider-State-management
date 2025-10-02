import 'package:flutter/widgets.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _favouriteItem = [];

  List<int> get favouriteItem => _favouriteItem;

  void addItem(int value) {
    if (_favouriteItem.contains(value)) {
      _favouriteItem.remove(value);
    } else {
      _favouriteItem.add(value);
    }
    notifyListeners();
  }

}
