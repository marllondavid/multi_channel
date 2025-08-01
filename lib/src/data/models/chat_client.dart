import 'package:multi_channel/src/data/models/chat_message.dart';

class ChatClient {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final List<ChatMessage> messages;

  ChatClient({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.messages,
  });
}
