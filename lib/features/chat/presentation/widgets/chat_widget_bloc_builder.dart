import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../manager/chat/chat_bloc.dart';
import 'bubble.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatWidgetBlocBuilder extends StatelessWidget {
  final List<types.Message> messages;
  final void Function(types.PartialText) handleSendPressed;

  const ChatWidgetBlocBuilder({
    super.key,
    required this.messages,
    required this.handleSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatBlocState>(
      builder: (context, state) {
        const chatTheme = DefaultChatTheme(
          backgroundColor: ColorManager.background,
          inputBackgroundColor: ColorManager.beige,
          sendButtonIcon:
              Icon(Icons.send, color: Color.fromARGB(255, 243, 242, 242)),
        );

        return Chat(
          messages: List.from(messages.reversed),
          onSendPressed: handleSendPressed,
          user: const types.User(id: 'user', firstName: 'User'),
          theme: chatTheme,
          bubbleBuilder: (context,
              {required message, required bool nextMessageInGroup}) {
            if (message.id.startsWith('loading_')) {
              return Container(
                padding: const EdgeInsets.all(AppPadding.p10),
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
    );
  }
}
