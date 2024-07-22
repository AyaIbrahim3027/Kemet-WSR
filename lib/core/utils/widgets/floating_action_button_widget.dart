import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorManager.white,
      shape: const CircleBorder(),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: AppSize.s40,
          height: AppSize.s40,
        ),
      ),
    );
  }
}
