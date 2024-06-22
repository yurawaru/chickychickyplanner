import 'package:chickychickyplanner/Model/collections.dart';
import 'package:flutter/material.dart';

class ItemCollectionProvider extends ChangeNotifier {
  final List<ItemCollection> _itemCollection = [];
  List<ItemCollection> get itemCollection => _itemCollection;

  void addItemCollections(ItemCollection item) {
    _itemCollection.add(item);
    notifyListeners();
  }

  List<ItemCollection> getItemCollectionForCourse(String id) {
    List<ItemCollection> itemsForCourse = [];
    for (var item in _itemCollection) {
      if (item.courseId == id) {
        itemsForCourse.add(item);
      }
    }
    return itemsForCourse;
  }
}
