import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/resources/app_style.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../core/utils/resources/values_manager.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              StringsManager.welcome,
              style: AppStyles.styleMedium18(),
            ),
            const SizedBox(width: AppSize.s10),
            const Icon(
              FontAwesomeIcons.faceGrinWide,
              size: AppSize.s22,
            ),
          ],
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          StringsManager.appName,
          style: AppStyles.styleSemiBold20(),
        ),
      ],
    );
  }
}
