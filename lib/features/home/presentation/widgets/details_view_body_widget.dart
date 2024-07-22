import 'package:flutter/material.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../core/utils/widgets/video_player_widget.dart';
import '../../data/models/statue_model.dart';

class DetailsViewBodyWidget extends StatelessWidget {
  const DetailsViewBodyWidget({super.key, required this.statueModel});
  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Center(
        child: FittedBox(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.86,
            // height: MediaQuery.of(context).size.height * 0.3,
            child: VideoPlayerWidget(
              videoUrl: statueModel.ai,
            ),
          ),
        ),
      ),
    );
  }
}
