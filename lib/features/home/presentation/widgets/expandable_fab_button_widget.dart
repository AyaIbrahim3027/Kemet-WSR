import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kemetwsr/features/home/data/models/statue_model.dart';
import '../../../../core/utils/functions/buildRotateFloatingActionButtonBuilder.dart';
import '../../../AR/presentation/views/launch_AR.dart';
import 'chat_button.dart';

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
        ChatButton(statueModel: statueModel),
        LaunchAR(statueModel: statueModel),
      ],
    );
  }
}

