import '../../data/models/chat_model.dart';

abstract class ChatRepoInterface {
  Future<ChatModel> getChatResponse(String prompt);
}
