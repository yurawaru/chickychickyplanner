import 'package:flutter/material.dart';

List<List<String>> dataTable = List.generate(12, (_) => List.filled(12, ''));

class TableProvider with ChangeNotifier {
  final List<List<String>> _dataTable =
      List.generate(13, (_) => List.filled(7, ''));

  List<List<String>> get dataTable => _dataTable;

  void updateTable(String courseName, String time) {
    for (int i = 0; i < time.length; i += 2) {
      int rowIndex = _parseText(time[i]);
      int colIndex = _parseText(time[i + 1]);
      if (rowIndex != -1 && colIndex != -1) {
        _dataTable[colIndex][rowIndex] = courseName;
        notifyListeners();
      }
    }
  }

  int _parseText(String text) {
    switch (text) {
      case 'M':
        return 0;
      case 'T':
        return 1;
      case 'W':
        return 2;
      case 'R':
        return 3;
      case 'F':
        return 4;
      case 'S':
        return 5;
      case 'U':
        return 6;
      case 'a':
        return 10;
      case 'b':
        return 11;
      case 'c':
        return 12;
      default:
        int value = int.tryParse(text) ?? -1;
        return (value > 0 && value < 10) ? value : -1;
    }
  }
}
