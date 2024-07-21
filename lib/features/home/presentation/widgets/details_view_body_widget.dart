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
            height: MediaQuery.of(context).size.height * 0.3,
            child: const VideoPlayerWidget(
              videoUrl:
                  'https://github.com/AyaIbrahim3027/ANMproject/raw/ee1c709b94000f51a47e14c6097acf8ded67711c/VR%20sample.mp4',
            ),
          ),
        ),
      ),
    );
  }
}
