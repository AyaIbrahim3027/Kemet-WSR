import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/color_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    this.onPressed,
    this.icon,
  });
  final void Function()? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorManager.white,
      shape: const CircleBorder(),
      child: icon ?? const Icon(FontAwesomeIcons.commentDots),
    );
  }
}
