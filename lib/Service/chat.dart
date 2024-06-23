import 'dart:async';
import 'dart:convert';
import 'package:chickychickyplanner/Model/chat_message.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatService {
  static const String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMWIzZmFkYjQtZmE4ZC00NmVlLTk3NzUtZjFjOTI2NDkxNTBiIiwidHlwZSI6ImFwaV90b2tlbiJ9.vbZAKUJagVQTC5askGVhGEPQjymseaRt4qkiT3_NQTM';
  static const String _url = 'https://api.edenai.run/v2/text/generation';

  final _messagesStreamController =
      StreamController<List<ChatMessage>>.broadcast();
  final List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> get messagesStream =>
      _messagesStreamController.stream;

  ChatService() {
    loadChatHistory();
  }

  Future<void> loadChatHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? messagesJson = prefs.getString('chat_history');
      if (messagesJson != null) {
        Iterable decoded = jsonDecode(messagesJson);
        _messages.clear();
        _messages.addAll(decoded.map((item) => ChatMessage.fromJson(item)));
        _messagesStreamController.add(List.from(_messages));
      }
    } catch (e) {
      throw Exception('Failed to load chat history: $e');
    }
  }

  Future<void> saveChatHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String messagesJson = jsonEncode(_messages);
      await prefs.setString('chat_history', messagesJson);
    } catch (e) {
      throw Exception('Failed to save chat history: $e');
    }
  }

  Future<void> clearChatHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('chat_history');
      _messages.clear();
      _messagesStreamController.add(List.from(_messages));
    } catch (e) {
      throw Exception('Failed to clear chat history: $e');
    }
  }

  Future<void> fetchMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    _messagesStreamController.add(List.of(_messages));
  }

  Future<void> fetchPromptResponse(String prompt) async {
    String fullPrompt = _buildFullPrompt(prompt);
    _messages.insert(0, ChatMessage(role: 'User Chicky Chicky', text: prompt));
    _messages.insert(
        0, ChatMessage(role: 'AI Assistant', text: 'Generating response...'));
    _messagesStreamController.add(List.from(_messages));

    var requestBody = jsonEncode({
      'providers': 'cohere',
      'text': fullPrompt,
      'temperature': 0.2,
      'max_tokens': 1000,
    });

    var response = await http.post(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: requestBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch response: ${response.statusCode}');
    }

    var data = json.decode(response.body);
    if (data != null && data['cohere'] != null) {
      var assistantResponse = data['cohere']['generated_text'];
      if (assistantResponse != null) {
        _messages[0] =
            ChatMessage(role: 'AI Assistant', text: assistantResponse);
      } else {
        throw Exception('Empty assistant response');
      }
    } else {
      throw Exception('Unexpected API response format');
    }

    _messagesStreamController.add(List.from(_messages));
    saveChatHistory();
  }

  String _buildFullPrompt(String currentPrompt) {
    StringBuffer fullPromptBuffer = StringBuffer(currentPrompt);
    for (int i = 1; i < _messages.length; i++) {
      fullPromptBuffer.write(' ');
      fullPromptBuffer.write(_messages[i].text);
    }
    return fullPromptBuffer.toString();
  }

  void dispose() {
    _messagesStreamController.close();
  }
}
