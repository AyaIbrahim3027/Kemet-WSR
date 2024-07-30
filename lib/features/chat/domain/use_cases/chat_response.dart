import '../entities/chat_entity.dart';
import '../repo/chat_repository_domain.dart';

class GetChatResponse {
  final ChatRepoInterface repo;

  GetChatResponse({required this.repo});

  Future<ChatEntity> execute(String prompt) async {
    final model = await repo.getChatResponse(prompt);
    return ChatEntity(response: model.response);
  }
}
