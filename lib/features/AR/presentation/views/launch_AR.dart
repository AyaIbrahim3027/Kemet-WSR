import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/widgets/button_widget.dart';
import '../../../../core/utils/widgets/floating_action_button_widget.dart';
import '../../../../core/utils/widgets/progress_indicator_widget.dart';
import '../../../home/data/models/statue_model.dart';
import '../../../home/presentation/manager/statue/statue_cubit.dart';
import '../../functions/launchARButton.dart';

class LaunchAR extends StatelessWidget {
  const LaunchAR({super.key, this.statueModel});
  final StatueModel? statueModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatueCubit, StatueState>(builder: (context, state) {
      if (state is StatueLoading) {
        return const ProgressIndicatorWidget();
      } else if (state is StatueSuccess) {
        return ButtonWidget(
          text: StringsManager.showAR,
          actionButton: FloatingActionButtonWidget(
            onPressed: () => launchARButton(context, arUrl: statueModel!.ar),
            icon: AssetsManager.arIcon,
          ),
        );
      } else if (state is StatueFailure) {
        return Center(child: Text('Error: ${state.errorMsg}'));
      } else {
        return const Center(child: Text('No data'));
      }
    });
  }
}
