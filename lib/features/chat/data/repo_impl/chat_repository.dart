import '../../domain/repo/chat_repository_domain.dart';
import '../data_source/chat_data_source.dart';
import '../models/chat_model.dart';

class ChatRepo implements ChatRepoInterface {
  final ChatDataSource dataSource;

  ChatRepo({required this.dataSource});

  @override
  Future<ChatModel> getChatResponse(String? prompt) async {
    try {
      final response = await dataSource.getResponse(prompt);
      return response;
    } catch (e) {
      throw Exception("Failed to get the response");
    }
  }
}
