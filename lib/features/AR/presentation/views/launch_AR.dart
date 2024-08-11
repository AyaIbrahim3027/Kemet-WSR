import 'package:flutter/material.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/widgets/button_widget.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../home/data/models/statue_model.dart';
import '../../functions/launchARButton.dart';

class LaunchAR extends StatelessWidget {
  const LaunchAR({super.key, this.statueModel});
  final StatueModel? statueModel;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: StringsManager.showAR,
      actionButton: FloatingActionButtonWidget(
        onPressed: () => launchARButton(context, arUrl: statueModel!.ar),
        icon: AssetsManager.arIcon,
      ),
    );
  }
}
