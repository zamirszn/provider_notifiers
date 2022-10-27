import 'package:flutter/material.dart';
import 'package:provider_notifiers/item_model.dart';

class AddItemNotifier extends ChangeNotifier {
  List<Item> itemList = [];

  addItem(String itemName) async {
    Item item = Item(itemName);
    itemList.add(item);
    notifyListeners();
  }
}
