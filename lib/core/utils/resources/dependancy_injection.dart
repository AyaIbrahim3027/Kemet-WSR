import 'package:get_it/get_it.dart';
import '../../../features/chat/data/data_source/chat_data_source.dart';
import '../../../features/chat/data/repo_impl/chat_repository.dart';
import '../../../features/chat/domain/use_cases/chat_response.dart';
import '../../../features/chat/presentation/manager/chat/chat_bloc.dart';
import 'data.dart';

final getIt = GetIt.instance;

void setup() {
  // Register historical figures with updated responses
  registerHistoricalFigures(figures);
}

void registerHistoricalFigures(Map<String, String> figures) {
  figures.forEach((name, description) {
    getIt.registerFactory(
        () => ChatDataSource(
              contexts: description,
              query: all_historical_figures[name]?["responses"],
            ),
        instanceName: '${name}DataSource');

    getIt.registerFactory(
        () => ChatRepo(
              dataSource:
                  getIt.get<ChatDataSource>(instanceName: '${name}DataSource'),
            ),
        instanceName: '${name}Repo');

    getIt.registerFactory(
        () => GetChatResponse(
              repo: getIt.get<ChatRepo>(instanceName: '${name}Repo'),
            ),
        instanceName: '${name}UseCase');

    getIt.registerFactory(
        () => ChatBloc(
              getChatResponse:
                  getIt.get<GetChatResponse>(instanceName: '${name}UseCase'),
            ),
        instanceName: '${name}Bloc');
  });
}
