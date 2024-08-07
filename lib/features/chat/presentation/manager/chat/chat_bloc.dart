import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_cases/chat_response.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatBlocState> {
  final GetChatResponse getChatResponse;

  ChatBloc({required this.getChatResponse}) : super(ChatInitialState()) {
    on<SendMessageEvent>((event, emit) async {
      // developer.log('Handling SendMessageEvent with message: ${event.message}');
      emit(ChatLoadingState());
      try {
        final response = await getChatResponse.execute(event.message!);
        // developer.log('Received response: ${response.response}');
        emit(ChatLoadedState(response.response));
      } catch (e) {
        // developer.log('Error occurred in getChatResponse: $e');
        emit(ChatErrorState(e.toString()));
      }
    });
  }
}
