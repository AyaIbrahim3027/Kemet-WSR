import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/core/utils/resources/assets_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:kemetwsr/features/home/data/models/statue_model.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/functions/buildRotateFloatingActionButtonBuilder.dart';
import '../../../../core/utils/resources/data.dart';
import '../../../../core/utils/widgets/button_widget.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../AR/presentation/views/launch_AR.dart';

class ExpandableFabButtonWidget extends StatelessWidget {
  const ExpandableFabButtonWidget({
    super.key,
    required this.statueModel,
  });
  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70,
      openButtonBuilder: buildRotateFloatingActionButtonBuilder(
        icon: FontAwesomeIcons.bars,
      ),
      closeButtonBuilder: buildRotateFloatingActionButtonBuilder(
        icon: FontAwesomeIcons.xmark,
      ),
      children: [
        ButtonWidget(
          text: StringsManager.chat,
          actionButton: FloatingActionButtonWidget(
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kChatPage,
                extra: {
                  'name': statueModel.name,
                  'contextName': figures[statueModel.name],
                  'query': all_historical_figures[statueModel.name]
                          ?["responses"] ??
                      {},
                },
              );
            },
            icon: AssetsManager.chatIcon,
          ),
        ),
        LaunchAR(
          statueModel: statueModel,
        ),
      ],
    );
  }
}
