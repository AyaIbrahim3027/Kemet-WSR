import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../manager/chat/chat_bloc.dart';
import 'bubble.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart'as types;

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}
class _ChatWidgetState extends State<ChatWidget> {
  final _messageController = TextEditingController();
  final List<types.Message> _messages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().stream.listen((state) {
      if (state is ChatLoadedState) {
        if (state.response != null && state.response!.isNotEmpty) {
          setState(() {
            // Remove the loading message if present
            _messages.removeWhere((msg) => msg.id.startsWith('loading_'));
            _messages.add(types.TextMessage(
              author: const types.User(id: 'bot', firstName: 'Bot'),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: 'msg_${_messages.length}',
              text: state.response!,
            ));
          });
        }
      } else if (state is ChatErrorState) {
        print('Error: ${state.error}');
      }
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final messageText = message.text.trim();
    if (messageText.isEmpty) return;

    setState(() {
      _messages.add(types.TextMessage(
        author: const types.User(id: 'user', firstName: 'User'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'msg_${_messages.length}',
        text: messageText,
      ));
      _messages.add(types.TextMessage(
        author: const types.User(id: 'bot', firstName: 'Bot'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'loading_${_messages.length}', // ID starts with 'loading_' for the animation
        text: '', // Empty text for loading message
      ));
    });
    final bloc = context.read<ChatBloc>();
    bloc.add(SendMessageEvent(messageText));
    _messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: BlocBuilder<ChatBloc, ChatBlocState>(
        builder: (context, state) {
          const chatTheme = DefaultChatTheme(
            inputBackgroundColor: Color.fromARGB(255, 119, 18, 18),

            sendButtonIcon: Icon(Icons.send, color: Color.fromARGB(255, 243, 242, 242)),
          );

          return Chat(
            messages: List.from(_messages.reversed),
            onSendPressed: _handleSendPressed,
            user: const types.User(id: 'user', firstName: 'User'),
            theme: chatTheme,
            bubbleBuilder: (context, {required message, required bool nextMessageInGroup}) {
              if (message.id.startsWith('loading_')) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black,
                    size: 50,
                  ),
                );
              } else {
                return MessageBubble(
                  message: message,
                  isNextMessageInGroup: nextMessageInGroup,
                  theme: chatTheme, // Pass theme data
                );
              }
            },
          );
        },
      ),
    );
  }
}

