import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/functions/buildAppBar.dart';
import '../manager/chat/chat_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'chat_widget_bloc_builder.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key, required this.characterName});
  final String characterName;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final messageController = TextEditingController();
  final List<types.Message> messages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().stream.listen((state) {
      if (state is ChatLoadedState) {
        if (state.response != null && state.response!.isNotEmpty) {
          setState(() {
            // Remove the loading message if present
            messages.removeWhere((msg) => msg.id.startsWith('loading_'));
            messages.add(types.TextMessage(
              author: const types.User(id: 'bot', firstName: 'Bot'),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: 'msg_${messages.length}',
              text: state.response!,
            ));
          });
        }
      } else if (state is ChatErrorState) {
        print('Error: ${state.error}');
      }
    });
  }

  void handleSendPressed(types.PartialText message) {
    final messageText = message.text.trim();
    if (messageText.isEmpty) return;

    setState(() {
      messages.add(types.TextMessage(
        author: const types.User(id: 'user', firstName: 'User'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'msg_${messages.length}',
        text: messageText,
      ));
      messages.add(types.TextMessage(
        author: const types.User(id: 'bot', firstName: 'Bot'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'loading_${messages.length}', // ID starts with 'loading_' for the animation
        text: '', // Empty text for loading message
      ));
    });
    final bloc = context.read<ChatBloc>();
    bloc.add(SendMessageEvent(messageText));
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        text: widget.characterName,
      ),
      body: ChatWidgetBlocBuilder(
        messages: messages,
        handleSendPressed: handleSendPressed,
      ),
    );
  }
}
