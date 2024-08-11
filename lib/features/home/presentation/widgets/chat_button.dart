import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/data.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/widgets/button_widget.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../data/models/statue_model.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
    required this.statueModel,
  });

  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: StringsManager.chat,
      actionButton: FloatingActionButtonWidget(
        onPressed: () {
          GoRouter.of(context).push(
            AppRouter.kChatPage,
            extra: {
              'name': statueModel.name,
              'contextName': figures[statueModel.name],
              'query':
              all_historical_figures[statueModel.name]?["responses"] ?? {},
            },
          );
        },
        icon: AssetsManager.chatIcon,
      ),
    );
  }
}
