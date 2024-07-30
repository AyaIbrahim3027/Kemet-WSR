import 'package:flutter/material.dart';
import 'package:kemetwsr/features/chat/presentation/widgets/chat_view_body_widget.dart';

import '../../../../core/utils/functions/buildAppBar.dart';
import '../../../home/data/models/statue_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.statueModel,
  });
  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context: context, text: statueModel.name),
        body: const ChatViewBodyWidget(),
      ),
    );
  }
}
