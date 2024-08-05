import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kemetwsr/core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/app_style.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';

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
              style: AppStyles.styleSemiBold20(context).copyWith(
                color: ColorManager.black.withOpacity(AppOpacity.op0_8),
              ),
            ),
            const SizedBox(width: AppSize.s10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AssetsManager.welcomeIcon,
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSize.s8),
      ],
    );
  }
}
