import 'package:flutter/material.dart';

class PromptTextProvider extends ChangeNotifier {
  final StringBuffer _textBuffer = StringBuffer();

  String get text => _textBuffer.toString();

  void appendText(String newText) {
    _textBuffer.write(newText);
    notifyListeners();
  }

  void clearText() {
    _textBuffer.clear();
    notifyListeners();
  }

  void deleteSentence(String sentenceToDelete) {
    List<String> sentences = _textBuffer.toString().split('. ');

    sentences
        .removeWhere((sentence) => sentence.trim() == sentenceToDelete.trim());

    _textBuffer.clear();
    for (String sentence in sentences) {
      if (sentence.isNotEmpty) {
        _textBuffer.write(sentence.trim());
        if (!sentence.endsWith('.')) {
          _textBuffer.write('. ');
        } else {
          _textBuffer.write(' ');
        }
      }
    }
    notifyListeners();
  }
}
