import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:kemetwsr/features/chat/presentation/widgets/chat_view_body_widget.dart';

import '../../../../core/utils/functions/buildAppBar.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context: context, text: StringsManager.chatFigure),
        body: const ChatViewBodyWidget(),
      ),
    );
  }
}
