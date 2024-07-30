import 'package:flutter/material.dart';
import '../widgets/chatwidget.dart';

class ChatPage extends StatelessWidget {
  final String contextName;
  final Map<String, String> query;
  final String characterName;

  const ChatPage({
    super.key,
    required this.contextName,
    required this.query,
    required this.characterName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChatWidget(
          characterName: characterName,
        ),
      ),
    );
  }
}
