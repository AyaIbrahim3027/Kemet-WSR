import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/values_manager.dart';

class MessageBubble extends StatelessWidget {
  final types.Message message;
  final bool isNextMessageInGroup;
  final DefaultChatTheme theme; // Add theme data

  const MessageBubble({
    super.key,
    required this.message,
    required this.isNextMessageInGroup,
    required this.theme, // Receive theme data
  });

  @override
  Widget build(BuildContext context) {
    if (message is types.TextMessage) {
      final textMessage = message as types.TextMessage;

      return Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          color: message.author.id == 'user'
              ? ColorManager.beige // Use theme color // user
              : ColorManager.black
                  .withOpacity(AppOpacity.op0_04), // Use theme color
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Text(
          textMessage.text, // Extract the text from the message
          style: theme.sentMessageBodyTextStyle.copyWith(
            // Use theme text style
            color: message.author.id == 'user'
                ? theme.sentMessageBodyTextStyle.color // user
                : theme.receivedMessageBodyTextStyle.color,
          ),
        ),
      );
    } else {
      // Handle other types of messages if necessary
      return const SizedBox
          .shrink(); // Return an empty widget or handle other types as needed
    }
  }
}
