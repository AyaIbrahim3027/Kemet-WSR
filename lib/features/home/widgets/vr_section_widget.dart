import 'package:flutter/material.dart';
import '../../../core/utils/resources/app_style.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../core/utils/resources/values_manager.dart';
import '../../../core/utils/widgets/video_player_widget.dart';

class VRSectionWidget extends StatelessWidget {
  const VRSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.soon,
              style: AppStyles.styleSemiBold20(),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const VideoPlayerWidget(
              videoUrl:
                  'https://github.com/AyaIbrahim3027/ANMproject/raw/ee1c709b94000f51a47e14c6097acf8ded67711c/VR%20sample.mp4',
            ),
          ],
        ),
      ),
    );
  }
}
