import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kemetwsr/core/utils/resources/assets_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import '../functions/buildRotateFloatingActionButtonBuilder.dart';
import 'button_widget.dart';
import 'floating_action_button_widget.dart';

class ExpandableFabButtonWidget extends StatelessWidget {
  const ExpandableFabButtonWidget({
    super.key,
  });

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
            onPressed: () {},
            icon: AssetsManager.chatIcon,
          ),
        ),
        ButtonWidget(
          text: StringsManager.showAR,
          actionButton: FloatingActionButtonWidget(
            onPressed: () {},
            icon: AssetsManager.arIcon,
          ),
        ),
      ],
    );
  }
}
