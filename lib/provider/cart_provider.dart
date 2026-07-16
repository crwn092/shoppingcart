//This is a state manager class

import 'package:flutter/cupertino.dart';

import '../model/item.dart';

class CartProvider extends ChangeNotifier {
  //Declare shared data here
  final List<Item> itemList = [];

  //Declare methods to deal with the shared data
  void add(Item item){
    itemList.add(item);
    notifyListeners(); //Notify consumer
  }

  void remove(Item item){
    itemList.remove(item);
    notifyListeners(); //Notify consumer
  }
}