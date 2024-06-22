class ChatMessage {
  final String role;
  final String text;

  ChatMessage({required this.role, required this.text});

  Map<String, dynamic> toJson() => {'role': role, 'text': text};

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      ChatMessage(role: json['role'], text: json['text']);
}
