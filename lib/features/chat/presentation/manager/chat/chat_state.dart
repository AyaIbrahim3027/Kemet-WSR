part of 'chat_bloc.dart';

@immutable
abstract class ChatBlocState {}

class ChatInitialState extends ChatBlocState {}

class ChatLoadingState extends ChatBlocState {
  ChatLoadingState();
}

class ChatLoadedState extends ChatBlocState {
  final String? response;

  ChatLoadedState(this.response);
}

class ChatErrorState extends ChatBlocState {
  final String error;

  ChatErrorState(this.error);
}
