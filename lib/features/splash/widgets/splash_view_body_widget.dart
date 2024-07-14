import 'package:flutter/material.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';
import 'package:kemetwsr/core/utils/resources/assets_manager.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:lottie/lottie.dart';
import '../../../core/utils/functions/navigateToHome.dart';

class SplashViewBodyWidget extends StatefulWidget {
  const SplashViewBodyWidget({super.key});

  @override
  State<SplashViewBodyWidget> createState() => _SplashViewBodyWidgetState();
}

class _SplashViewBodyWidgetState extends State<SplashViewBodyWidget> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              ColorManager.background,
              BlendMode.modulate,
            ),
            child: Lottie.asset(
              AssetsManager.splash,
            ),
          ),
        ),
        Positioned(
          // top: 500,
          top: height * 0.58,
          left: width * 0.35,
          child: Text(
            StringsManager.appName,
            style: AppStyles.styleMedium22(),
          ),
        )
      ],
    );
  }
}
