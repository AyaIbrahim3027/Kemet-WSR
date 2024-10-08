import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/app_style.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../core/utils/widgets/video_player_widget.dart';

class VRSectionWidget extends StatelessWidget {
  const VRSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        Text(
          StringsManager.soon,
          style: AppStyles.styleSemiBold23(context).copyWith(
            color: ColorManager.brown,
          ),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        const VideoPlayerWidget(
          videoUrl:
              'https://github.com/AyaIbrahim3027/ANMproject/raw/ee1c709b94000f51a47e14c6097acf8ded67711c/VR%20sample.mp4',
        ),
      ],
    );
  }
}
