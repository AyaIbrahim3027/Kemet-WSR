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
              style: AppStyles.styleSemiBold23(context).copyWith(
                color: ColorManager.brown,
              ),
            ),
            const SizedBox(width: AppSize.s10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AssetsManager.welcomeIcon,
                height: MediaQuery.of(context).size.height * 0.035,
                colorFilter: const ColorFilter.mode(
                  ColorManager.brown, // The color you want to apply
                  BlendMode.srcIn, // Blend mode to apply the color
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSize.s8),
      ],
    );
  }
}
