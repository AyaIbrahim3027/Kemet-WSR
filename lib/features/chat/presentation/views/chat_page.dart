import 'package:flutter/material.dart';

import 'chatwidget.dart';

class ChatPage extends StatelessWidget {
  final String contextName;
  final Map<String, String> query;

  const ChatPage({Key? key, required this.contextName, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatWidget(),
    );
  }
}
